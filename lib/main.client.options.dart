// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:portfolio/components/stage/project_stage.dart'
    deferred as _project_stage;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'project_stage': ClientLoader(
      (p) => _project_stage.ProjectStage(
        languageCode: p['languageCode'] as String,
      ),
      loader: _project_stage.loadLibrary,
    ),
  },
);
