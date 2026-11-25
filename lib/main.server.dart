/// The entrypoint for the **server** environment: it runs only while the
/// static site is being built (doc/01-site-plan.md, D-1).
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';
import 'styles/theme.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      viewport: 'width=device-width, initial-scale=1',
      head: [
        link(rel: 'icon', href: '/favicon.ico'),
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(rel: 'preconnect', href: 'https://fonts.gstatic.com', attributes: {'crossorigin': ''}),
        link(rel: 'stylesheet', href: fontsUrl),
      ],
      body: const App(),
    ),
  );
}
