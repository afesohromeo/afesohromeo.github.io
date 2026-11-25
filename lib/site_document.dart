import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'styles/theme.dart';

/// The HTML document every page is rendered into: the `<head>` shared by all
/// pages, and the [App] in the body. Pages add their own head tags (title,
/// description, languages) with `Document.head` in `pages/home_page.dart`.
///
/// It lives here, not in `main.server.dart`, so the tests render the same
/// document the real build does.
Document siteDocument() {
  return Document(
    viewport: 'width=device-width, initial-scale=1',
    head: [
      link(rel: 'icon', href: '/favicon.ico', attributes: {'sizes': '32x32'}),
      link(rel: 'apple-touch-icon', href: '/apple-touch-icon.png'),
      link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
      link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': ''}),
      link(rel: 'stylesheet', href: fontsUrl),
    ],
    body: const App(),
  );
}
