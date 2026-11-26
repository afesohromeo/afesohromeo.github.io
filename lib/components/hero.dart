import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../l10n/strings.dart';
import '../site.dart';
import '../styles/theme.dart';
import 'email_buttons.dart';

/// The opening: who this is, in one line, and how to get in touch
/// (doc/01-site-plan.md §1). It is the left column's top part in [Intro].
class Hero extends StatelessComponent {
  const Hero({required this.strings, super.key});

  final Strings strings;

  @override
  Component build(BuildContext context) {
    return div(classes: 'intro-text', [
      p(classes: 'eyebrow', [.text(strings.eyebrow)]),
      h1([
        .text('${strings.headlineStart} '),
        span(classes: 'accent', [.text(strings.headlineEnd)]),
      ]),
      p(classes: 'lead', [.text(strings.intro)]),
      div(classes: 'contact', [
        // An island of its own: the address is put together in the browser (D-5).
        EmailButtons(languageCode: strings.languageCode),
        a(
          href: githubUrl,
          attributes: {'target': '_blank', 'rel': 'noopener'},
          [.text('GitHub ↗')],
        ),
        a(
          href: linkedinUrl,
          attributes: {'target': '_blank', 'rel': 'noopener'},
          [.text('LinkedIn ↗')],
        ),
        a(href: cvPath, classes: 'cv', attributes: {'type': 'application/pdf'}, [.text(strings.cvLabel)]),
      ]),
      div(classes: 'divider', []),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.intro-text', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(28.px),
        raw: {'grid-area': 'text'},
      ),
      css('.eyebrow').styles(
        margin: .zero,
        color: mutedColor,
        fontFamily: monoFont,
        fontSize: 13.px,
        letterSpacing: 0.02.em,
      ),
      css('h1').styles(
        margin: .zero,
        fontFamily: headingFont,
        fontWeight: .w700,
        letterSpacing: (-0.035).em,
        lineHeight: 1.02.em,
        raw: {'font-size': 'clamp(40px, 5.4vw, 68px)'},
      ),
      css('h1 .accent').styles(color: accentColor),
      css('.lead').styles(
        maxWidth: 560.px,
        margin: .zero,
        color: softTextColor,
        fontSize: 18.px,
      ),
      css('.contact', [
        css('&').styles(display: .flex, flexWrap: .wrap, gap: .all(10.px)),
        css('a, button').styles(
          display: .inlineFlex,
          minHeight: 48.px,
          padding: .symmetric(horizontal: 18.px),
          border: .all(color: strongLineColor, width: 1.px),
          radius: .circular(999.px),
          alignItems: .center,
          color: textColor,
          fontFamily: bodyFont,
          fontSize: 16.px,
          fontWeight: .w500,
          textDecoration: TextDecoration(line: .none),
        ),
        css('a:hover, button:hover').styles(
          border: .all(color: accentColor, width: 1.px),
        ),
      ]),
      css('.divider').styles(height: 1.px, backgroundColor: lineColor),
    ]),
    // Beside the device (see Intro), the column is narrower: a smaller headline
    // keeps the project buttons on the first screen, in both languages.
    css.media(MediaQuery.screen(minWidth: 1040.px), [
      css('.intro-text h1').styles(raw: {'font-size': 'clamp(40px, 3.6vw, 52px)'}),
    ]),
  ];
}
