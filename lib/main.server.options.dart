// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:portfolio/components/stage/device_frame.dart' as _device_frame;
import 'package:portfolio/components/stage/project_buttons.dart'
    as _project_buttons;
import 'package:portfolio/components/stage/project_panel.dart'
    as _project_panel;
import 'package:portfolio/components/stage/project_stage.dart'
    as _project_stage;
import 'package:portfolio/components/stage/slide_controls.dart'
    as _slide_controls;
import 'package:portfolio/components/email_buttons.dart' as _email_buttons;
import 'package:portfolio/components/hero.dart' as _hero;
import 'package:portfolio/components/intro.dart' as _intro;
import 'package:portfolio/components/site_header.dart' as _site_header;
import 'package:portfolio/styles/theme.dart' as _theme;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _email_buttons.EmailButtons: ClientTarget<_email_buttons.EmailButtons>(
      'email_buttons',
      params: __email_buttonsEmailButtons,
    ),
    _project_stage.ProjectStage: ClientTarget<_project_stage.ProjectStage>(
      'project_stage',
      params: __project_stageProjectStage,
    ),
  },
  styles: () => [
    ..._theme.globalStyles,
    ..._email_buttons.EmailButtons.styles,
    ..._hero.Hero.styles,
    ..._intro.Intro.styles,
    ..._site_header.SiteHeader.styles,
    ..._device_frame.DeviceFrame.styles,
    ..._project_buttons.ProjectButtons.styles,
    ..._project_panel.ProjectPanel.styles,
    ..._project_stage.ProjectStage.styles,
    ..._slide_controls.SlideControls.styles,
  ],
);

Map<String, Object?> __email_buttonsEmailButtons(
  _email_buttons.EmailButtons c,
) => {'languageCode': c.languageCode};
Map<String, Object?> __project_stageProjectStage(
  _project_stage.ProjectStage c,
) => {'languageCode': c.languageCode};
