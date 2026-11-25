import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/hero.dart';
import '../components/site_header.dart';
import '../l10n/strings.dart';
import '../site.dart';

/// The whole site: one page, in the language of [strings].
class HomePage extends StatelessComponent {
  const HomePage({required this.strings, super.key});

  final Strings strings;

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      Document.html(attributes: {'lang': strings.languageCode}),
      Document.head(
        title: strings.pageTitle,
        meta: {'description': strings.pageDescription},
        children: [
          for (final language in Strings.all)
            link(
              rel: 'alternate',
              href: '$siteUrl${language.homePath}',
              attributes: {'hreflang': language.languageCode},
            ),
          link(rel: 'alternate', href: '$siteUrl/', attributes: {'hreflang': 'x-default'}),
        ],
      ),
      SiteHeader(strings: strings),
      main_([Hero(strings: strings)]),
    ]);
  }
}
