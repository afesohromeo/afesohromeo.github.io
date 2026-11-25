/// The entrypoint for the **server** environment: it runs only while the
/// static site is being built (doc/01-site-plan.md, D-1).
library;

import 'package:jaspr/server.dart';

import 'main.server.options.dart';
import 'site_document.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(siteDocument());
}
