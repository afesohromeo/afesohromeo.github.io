import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../l10n/strings.dart';
import '../styles/theme.dart';
import 'hero.dart';
import 'stage/project_stage.dart';

/// The first screen, as in the approved mockup: on wide screens, the hero and
/// the project picker on the left, the selected project's device on the right.
/// On narrow screens, the same parts one under the other.
///
/// The parts come from two components (the static [Hero] and the interactive
/// [ProjectStage]), but they are laid out by one grid here: the stage's
/// wrappers use `display: contents`, so their children are placed directly in
/// this grid's named areas: text, picker, facts and device.
class Intro extends StatelessComponent {
  const Intro({required this.strings, super.key});

  final Strings strings;

  @override
  Component build(BuildContext context) {
    return section(classes: 'intro', [
      Hero(strings: strings),
      ProjectStage(languageCode: strings.languageCode),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.intro').styles(
      display: .grid,
      maxWidth: contentWidth,
      padding: .only(top: 56.px, left: 24.px, right: 24.px, bottom: 48.px),
      margin: .symmetric(horizontal: .auto),
      raw: {
        'grid-template-columns': 'minmax(0, 1fr)',
        'grid-template-areas': '"text" "picker" "facts" "device"',
        'row-gap': '28px',
        'column-gap': '56px',
      },
    ),
    // Two columns once there's room for the text beside the device. The device
    // spans all three rows and sits in their middle.
    css.media(MediaQuery.screen(minWidth: 1040.px), [
      css('.intro').styles(
        raw: {
          'grid-template-columns': 'minmax(0, 1fr) auto',
          'grid-template-rows': 'auto auto 1fr',
          'grid-template-areas': '"text device" "picker device" "facts device"',
        },
      ),
    ]),
  ];
}
