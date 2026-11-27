import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../content/project.dart';
import '../../l10n/strings.dart';
import '../../styles/theme.dart';
import 'device_frame.dart';
import 'slide_controls.dart';

/// One project: problem, what was built, result, its link, and its device.
class ProjectPanel extends StatelessComponent {
  const ProjectPanel({
    required this.project,
    required this.strings,
    required this.shown,
    required this.slide,
    required this.playing,
    required this.onShowSlide,
    required this.onTogglePlaying,
    super.key,
  });

  final Project project;
  final Strings strings;

  /// Hidden panels stay in the HTML with the `hidden` attribute.
  final bool shown;

  // The slideshow, controlled by the stage (see SlideControls).
  final int slide;
  final bool playing;
  final void Function(int slide) onShowSlide;
  final void Function() onTogglePlaying;

  @override
  Component build(BuildContext context) {
    final text = strings.project(project.id);
    final liveUrl = project.liveUrl;

    return div(
      id: 'project-${project.id.name}',
      classes: 'project-panel',
      attributes: {if (!shown) 'hidden': ''},
      [
        div(classes: 'project-text', [
          dl([
            dt([.text(strings.problemLabel)]),
            dd([.text(text.problem)]),
            dt([.text(strings.builtLabel)]),
            dd([.text(text.built)]),
            dt([.text(strings.resultLabel)]),
            dd([.text(text.result)]),
          ]),
          if (liveUrl != null)
            a(
              href: liveUrl,
              classes: 'live-link',
              attributes: {'target': '_blank', 'rel': 'noopener'},
              [.text('${strings.liveLinkLabel} ↗')],
            ),
        ]),
        div(classes: 'project-device', [
          DeviceFrame(project: project, strings: strings, slide: slide, eager: shown),
          SlideControls(
            strings: strings,
            count: project.slides.length,
            current: slide,
            playing: playing,
            onShowSlide: onShowSlide,
            onTogglePlaying: onTogglePlaying,
          ),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    // Like the stage, the panel draws no box: its text goes to the Intro grid's
    // "facts" area and its device to the "device" area. A hidden panel's parts
    // are not displayed at all.
    css('.project-panel', [
      css('&').styles(display: .contents),
      css('&[hidden]').styles(display: .none),
    ]),
    css('.project-text', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
        gap: .all(16.px),
        raw: {'grid-area': 'facts'},
      ),
      css('dl').styles(
        display: .grid,
        maxWidth: 600.px,
        margin: .zero,
        raw: {'grid-template-columns': '96px minmax(0, 1fr)', 'column-gap': '16px', 'row-gap': '12px'},
      ),
      css('dt').styles(
        padding: .only(top: 3.px),
        color: mutedColor,
        fontFamily: monoFont,
        fontSize: 12.px,
      ),
      css('dd').styles(margin: .zero, color: const Color('#DDE1E6')),
      css('.live-link', [
        css('&').styles(
          display: .inlineFlex,
          minHeight: 44.px,
          alignItems: .center,
          color: accentColor,
          fontWeight: .w600,
          textDecoration: TextDecoration(line: .none),
        ),
        css('&:hover').styles(textDecoration: TextDecoration(line: .underline)),
      ]),
    ]),
    css('.project-device').styles(alignSelf: .center, raw: {'grid-area': 'device'}),
  ];
}
