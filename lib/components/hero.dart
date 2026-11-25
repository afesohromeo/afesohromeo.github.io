import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../l10n/strings.dart';
import '../styles/theme.dart';

/// The opening: who this is, in one line (doc/01-site-plan.md §1).
class Hero extends StatelessComponent {
  const Hero({required this.strings, super.key});

  final Strings strings;

  @override
  Component build(BuildContext context) {
    return section(classes: 'hero', [
      p(classes: 'eyebrow', [.text(strings.eyebrow)]),
      h1([
        .text('${strings.headlineStart} '),
        span(classes: 'accent', [.text(strings.headlineEnd)]),
      ]),
      p(classes: 'intro', [.text(strings.intro)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero', [
      css('&').styles(
        display: .flex,
        maxWidth: contentWidth,
        padding: .symmetric(vertical: 72.px, horizontal: 24.px),
        margin: .symmetric(horizontal: .auto),
        flexDirection: .column,
        gap: .all(28.px),
      ),
      css('.eyebrow').styles(
        margin: .zero,
        color: mutedColor,
        fontFamily: monoFont,
        fontSize: 13.px,
        letterSpacing: 0.02.em,
      ),
      css('h1').styles(
        maxWidth: 16.em,
        margin: .zero,
        fontFamily: headingFont,
        fontWeight: .w700,
        letterSpacing: (-0.035).em,
        lineHeight: 1.02.em,
        raw: {'font-size': 'clamp(40px, 5.4vw, 68px)'},
      ),
      css('h1 .accent').styles(color: accentColor),
      css('.intro').styles(
        maxWidth: 560.px,
        margin: .zero,
        color: softTextColor,
        fontSize: 18.px,
      ),
    ]),
  ];
}
