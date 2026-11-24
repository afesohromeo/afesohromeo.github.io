import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'l10n/strings.dart';
import 'pages/home_page.dart';

/// One page per language (doc/01-site-plan.md, D-2).
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Router(
      routes: [
        for (final strings in Strings.all)
          Route(
            path: _routePath(strings.homePath),
            builder: (context, state) => HomePage(strings: strings),
          ),
      ],
    );
  }

  /// The router rejects a trailing slash; links keep it ('/fr/'), since the
  /// static build writes each page as `<path>/index.html`.
  static String _routePath(String homePath) => homePath == '/' ? homePath : homePath.substring(0, homePath.length - 1);
}
