import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../content/project.dart';
import '../../content/projects.dart';
import '../../l10n/strings.dart';
import '../../styles/theme.dart';
import 'project_buttons.dart';
import 'project_panel.dart';

/// The stage: the project buttons, and the selected project's panel
/// (doc/01-site-plan.md, step 2).
///
/// `@client` makes this an island that also runs in the browser: it is
/// rendered to HTML at build time like the rest of the page, then the browser
/// takes it over so the buttons respond to clicks. Its parameters travel inside
/// the HTML, so they must be plain data: the language code, not [Strings].
@client
class ProjectStage extends StatefulComponent {
  const ProjectStage({required this.languageCode, super.key});

  final String languageCode;

  @override
  State<ProjectStage> createState() => _ProjectStageState();

  @css
  static List<StyleRule> get styles => [
    css('.stage', [
      css('&').styles(
        maxWidth: contentWidth,
        padding: .symmetric(horizontal: 24.px, vertical: 48.px),
        margin: .symmetric(horizontal: .auto),
      ),
      css('h2').styles(
        margin: .only(bottom: 20.px),
        color: textColor,
        fontFamily: headingFont,
        fontSize: 28.px,
        fontWeight: .w700,
      ),
    ]),
  ];
}

class _ProjectStageState extends State<ProjectStage> {
  /// The only state on the stage (D-12): which project is shown.
  var _selected = projects.first.id;

  void _select(ProjectId id) => setState(() => _selected = id);

  @override
  Component build(BuildContext context) {
    final strings = Strings.of(component.languageCode);

    return section(
      classes: 'stage',
      attributes: {'aria-labelledby': 'stage-heading'},
      [
        h2(id: 'stage-heading', [.text(strings.stageHeading)]),
        ProjectButtons(strings: strings, selected: _selected, onSelect: _select),
        // Every project is rendered, and the others are hidden: their text is in
        // the HTML for search engines, and switching needs no loading.
        for (final project in projects)
          ProjectPanel(project: project, strings: strings, shown: project.id == _selected),
      ],
    );
  }
}
