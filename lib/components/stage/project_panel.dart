import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../content/project.dart';
import '../../l10n/strings.dart';
import '../../styles/theme.dart';
import 'device_frame.dart';

/// One project: problem, what was built, result, its link, and its device.
class ProjectPanel extends StatelessComponent {
  const ProjectPanel({required this.project, required this.strings, required this.shown, super.key});

  final Project project;
  final Strings strings;

  /// Hidden panels stay in the HTML with the `hidden` attribute.
  final bool shown;

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
        DeviceFrame(project: project, strings: strings, slide: 0, eager: shown),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.project-panel', [
      css('&').styles(
        display: .grid,
        alignItems: .center,
        gap: .all(40.px),
        raw: {'grid-template-columns': 'minmax(0, 1fr)'},
      ),
      css('&[hidden]').styles(display: .none),
    ]),
    css.media(MediaQuery.screen(minWidth: 900.px), [
      css('.project-panel').styles(raw: {'grid-template-columns': 'minmax(0, 5fr) minmax(0, 7fr)'}),
    ]),
    css('.project-text', [
      css('dl').styles(
        display: .grid,
        margin: .zero,
        gap: .all(8.px),
        raw: {'grid-template-columns': 'max-content 1fr', 'column-gap': '20px'},
      ),
      css('dt').styles(
        padding: .only(top: 3.px),
        color: mutedColor,
        fontFamily: monoFont,
        fontSize: 12.px,
      ),
      css('dd').styles(margin: .zero, color: softTextColor, lineHeight: 1.6.em),
      css('.live-link', [
        css('&').styles(
          display: .inlineBlock,
          margin: .only(top: 20.px),
          color: accentColor,
          fontWeight: .w600,
          textDecoration: TextDecoration(line: .none),
        ),
        css('&:hover').styles(textDecoration: TextDecoration(line: .underline)),
      ]),
    ]),
  ];
}
