import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../l10n/strings.dart';
import '../styles/theme.dart';

/// The logo, the name, and the switch to the other language.
class SiteHeader extends StatelessComponent {
  const SiteHeader({required this.strings, super.key});

  final Strings strings;

  @override
  Component build(BuildContext context) {
    final other = Strings.all.firstWhere((language) => language != strings);

    return header(classes: 'site-header', [
      a(href: strings.homePath, classes: 'brand', [
        img(src: '/images/logo.jpg', alt: 'Afesoh Romeo logo', width: 56, height: 56),
        span([.text('Afesoh Romeo')]),
      ]),
      a(
        href: other.homePath,
        classes: 'language-switch',
        attributes: {'hreflang': other.languageCode, 'lang': other.languageCode},
        [.text(strings.otherLanguageName)],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.site-header', [
      css('&').styles(
        display: .flex,
        maxWidth: contentWidth,
        padding: .only(top: 24.px, left: 24.px, right: 24.px),
        margin: .symmetric(horizontal: .auto),
        flexWrap: .wrap,
        justifyContent: .spaceBetween,
        alignItems: .center,
        gap: .all(16.px),
      ),
      css('.brand').styles(
        display: .flex,
        alignItems: .center,
        gap: .all(12.px),
        color: textColor,
        fontFamily: headingFont,
        fontSize: 18.px,
        fontWeight: .w700,
        textDecoration: TextDecoration(line: .none),
      ),
      css('.brand img').styles(
        display: .block,
        border: .all(color: lineColor, width: 1.px),
        radius: .circular(14.px),
        raw: {'object-fit': 'cover'},
      ),
      css('.language-switch', [
        css('&').styles(
          display: .inlineFlex,
          minHeight: 44.px,
          padding: .symmetric(horizontal: 18.px),
          border: .all(color: strongLineColor, width: 1.px),
          radius: .circular(999.px),
          alignItems: .center,
          color: textColor,
          fontSize: 14.px,
          fontWeight: .w600,
          textDecoration: TextDecoration(line: .none),
        ),
        css('&:hover').styles(
          border: .all(color: accentColor, width: 1.px),
        ),
      ]),
    ]),
  ];
}
