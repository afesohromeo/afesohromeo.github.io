import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../content/project.dart';
import '../../content/projects.dart';
import '../../l10n/strings.dart';
import '../../styles/theme.dart';

/// One button per project. The pressed one is the project on show.
///
/// This is an ordinary component inside the `@client` [ProjectStage], so it can
/// take a [Strings] object and a callback: only the island's own parameters
/// have to be plain data.
class ProjectButtons extends StatelessComponent {
  const ProjectButtons({required this.strings, required this.selected, required this.onSelect, super.key});

  final Strings strings;
  final ProjectId selected;
  final void Function(ProjectId id) onSelect;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'project-buttons',
      attributes: {'role': 'group', 'aria-label': strings.projectChoiceLabel},
      [
        for (final project in projects)
          button(
            type: .button,
            classes: 'project-button',
            // aria-pressed tells screen readers which button is on;
            // aria-controls, which part of the page it changes.
            attributes: {
              'aria-pressed': '${project.id == selected}',
              'aria-controls': 'project-${project.id.name}',
            },
            onClick: () => onSelect(project.id),
            [
              span(classes: 'name', [.text(project.name)]),
              span(classes: 'kind', [.text(strings.project(project.id).kind)]),
            ],
          ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.project-buttons').styles(display: .flex, flexWrap: .wrap, gap: .all(10.px)),
    // Pills, as in the mockup: the selected one is filled with the accent.
    css('.project-button', [
      css('&').styles(
        display: .inlineFlex,
        minHeight: 48.px,
        padding: .symmetric(horizontal: 18.px),
        border: .all(color: strongLineColor, width: 1.px),
        radius: .circular(999.px),
        cursor: .pointer,
        alignItems: .center,
        gap: .all(10.px),
        color: textColor,
        fontFamily: bodyFont,
        backgroundColor: Colors.transparent,
      ),
      css('&:hover').styles(
        border: .all(color: accentColor, width: 1.px),
      ),
      css('&[aria-pressed="true"]').styles(
        border: .all(color: accentColor, width: 1.px),
        color: groundColor,
        backgroundColor: accentColor,
      ),
      css('.name').styles(fontFamily: headingFont, fontSize: 17.px, fontWeight: .w700),
      css('.kind').styles(opacity: 0.8, fontSize: 13.px),
    ]),
  ];
}
