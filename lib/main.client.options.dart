// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:portfolio/components/stage/project_stage.dart'
    deferred as _project_stage;
import 'package:portfolio/components/email_buttons.dart'
    deferred as _email_buttons;

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
    'email_buttons': ClientLoader(
      (p) => _email_buttons.EmailButtons(
        languageCode: p['languageCode'] as String,
      ),
      loader: _email_buttons.loadLibrary,
    ),
    'project_stage': ClientLoader(
      (p) => _project_stage.ProjectStage(
        languageCode: p['languageCode'] as String,
      ),
      loader: _project_stage.loadLibrary,
    ),
  },
);
