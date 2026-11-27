@TestOn('vm')
library;

import 'dart:io';

import 'package:jaspr/dom.dart';
import 'package:jaspr_test/server_test.dart';
import 'package:portfolio/components/email_buttons.dart';
import 'package:portfolio/l10n/strings.dart';
import 'package:portfolio/site.dart';
import 'package:portfolio/site_document.dart';

// Plan: doc/01-site-plan.md §1 (contact in the opening) and D-5 (the email
// address never appears in the HTML).

void main() {
  for (final (path, strings) in [('/', Strings.en), ('/fr/', Strings.fr)]) {
    group('Given the contact row on the page at $path', () {
      Future<DocumentResponse> get(ServerTester tester) {
        tester.pumpComponent(siteDocument());
        return tester.request(path);
      }

      testServer('then it has Email me, Copy address, GitHub, LinkedIn and the CV, in that order', (tester) async {
        final doc = (await get(tester)).document!;

        final labels = doc.querySelectorAll('.contact button, .contact a').map((e) => e.text.trim());
        expect(labels, [
          strings.emailMeLabel,
          strings.copyEmailLabel,
          startsWith('GitHub'),
          startsWith('LinkedIn'),
          strings.cvLabel,
        ]);
      });

      testServer('then the email address is nowhere in the HTML', (tester) async {
        final body = (await get(tester)).body;

        expect(body, isNot(contains('@gmail.com')));
        expect(body, isNot(contains('afesohromeo@')));
        expect(body, isNot(contains('mailto:')));
      });

      testServer('then LinkedIn opens in a new tab, and the CV is a file of this site', (tester) async {
        final doc = (await get(tester)).document!;

        final linkedin = doc.querySelector('.contact a[href="$linkedinUrl"]')!;
        expect(linkedin.attributes['target'], '_blank');
        expect(linkedin.attributes['rel'], 'noopener');
        final cv = doc.querySelector('.contact a.cv')!;
        expect(cv.attributes['href'], cvPath);
        expect(File('web$cvPath').existsSync(), isTrue, reason: '$cvPath is missing from web/');
      });
    });
  }

  testComponents('Given the email buttons, when Copy address is clicked, then it says the address was copied', (
    tester,
  ) async {
    tester.pumpComponent(const EmailButtons(languageCode: 'en'));

    await tester.click(find.componentWithText(button, Strings.en.copyEmailLabel));

    expect(find.text(Strings.en.emailCopiedLabel), findsOneComponent);
  });
}
