import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../l10n/strings.dart';
import '../styles/theme.dart';

/// The logo, the name, and the EN | FR switch.
class SiteHeader extends StatelessComponent {
  const SiteHeader({required this.strings, super.key});

  final Strings strings;

  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      a(href: strings.homePath, classes: 'brand', [
        img(src: '/images/logo.jpg', alt: 'Afesoh Romeo logo', width: 56, height: 56),
        span([.text('Afesoh Romeo')]),
      ]),
      // One link per language. They are links, not buttons: each language is
      // its own page (D-2), so switching is going to another address.
      nav(
        classes: 'language-switch',
        attributes: {'aria-label': 'Language / Langue'},
        [
          for (final language in Strings.all)
            a(
              href: language.homePath,
              attributes: {
                'hreflang': language.languageCode,
                'lang': language.languageCode,
                'aria-label': language.languageName,
                if (language == strings) 'aria-current': 'page',
              },
              [.text(language.languageCode.toUpperCase())],
            ),
        ],
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
      // EN | FR: a rounded pill; the current language is filled.
      css('.language-switch', [
        css('&').styles(
          display: .flex,
          padding: .all(3.px),
          border: .all(color: strongLineColor, width: 1.px),
          radius: .circular(999.px),
        ),
        css('a').styles(
          display: .inlineFlex,
          minWidth: 48.px,
          minHeight: 38.px,
          radius: .circular(999.px),
          justifyContent: .center,
          alignItems: .center,
          color: softTextColor,
          fontSize: 14.px,
          fontWeight: .w600,
          textDecoration: TextDecoration(line: .none),
        ),
        css('a:hover').styles(color: textColor),
        css('a[aria-current="page"]').styles(color: groundColor, backgroundColor: textColor),
      ]),
    ]),
  ];
}
