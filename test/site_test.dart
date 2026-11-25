@TestOn('vm')
library;

import 'package:jaspr/server.dart' as jaspr;
import 'package:jaspr_test/server_test.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/l10n/strings.dart';

// Plan: doc/01-site-plan.md, step 1 and D-2 (English at /, French at /fr/).

Future<DocumentResponse> _get(ServerTester tester, String path) {
  tester.pumpComponent(const jaspr.Document(body: App()));
  return tester.request(path);
}

void main() {
  for (final (path, strings) in [('/', Strings.en), ('/fr/', Strings.fr)]) {
    group('Given the page at $path', () {
      testServer('then it is in ${strings.languageCode}', (tester) async {
        final response = await _get(tester, path);

        expect(response.statusCode, 200);
        final html = response.document!.documentElement!;
        expect(html.attributes['lang'], strings.languageCode);
        expect(response.document!.querySelector('h1')!.text, contains(strings.headlineStart));
      });

      testServer('then it has a title and a description', (tester) async {
        final response = await _get(tester, path);
        final doc = response.document!;

        expect(doc.querySelector('title')!.text, strings.pageTitle);
        expect(
          doc.querySelector('meta[name="description"]')!.attributes['content'],
          strings.pageDescription,
        );
      });

      testServer('then it tells search engines where both languages are', (tester) async {
        final response = await _get(tester, path);
        final doc = response.document!;

        String? alternate(String lang) =>
            doc.querySelector('link[rel="alternate"][hreflang="$lang"]')?.attributes['href'];
        expect(alternate('en'), 'https://afesohromeo.github.io/');
        expect(alternate('fr'), 'https://afesohromeo.github.io/fr/');
        expect(alternate('x-default'), 'https://afesohromeo.github.io/');
      });

      testServer('then the language switch goes to the other language', (tester) async {
        final response = await _get(tester, path);
        final other = strings == Strings.en ? Strings.fr : Strings.en;

        final switchLink = response.document!.querySelector('a[hreflang="${other.languageCode}"]')!;
        expect(switchLink.attributes['href'], other.homePath);
        expect(switchLink.text.trim(), strings.otherLanguageName);
      });
    });
  }
}
