import 'dart:async';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

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
    // The stage draws no box of its own: its parts are placed in the Intro's
    // grid (see Intro).
    css('.stage').styles(display: .contents),
    css('.stage-picker', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(16.px),
        raw: {'grid-area': 'picker'},
      ),
      // "Selected work": a small label, as in the mockup, but still a heading
      // for screen readers.
      css('h2').styles(
        margin: .zero,
        color: mutedColor,
        fontFamily: monoFont,
        fontSize: 12.px,
        fontWeight: .w400,
        textTransform: .upperCase,
        letterSpacing: 0.12.em,
      ),
    ]),
  ];
}

class _ProjectStageState extends State<ProjectStage> {
  /// How long each slide stays on screen while the slideshow plays.
  static const _slideTime = Duration(seconds: 5);

  // The stage's state (D-12): which project and slide are shown, and whether
  // the slideshow moves by itself.
  var _selected = projects.first.id;
  var _slide = 0;
  late bool _playing;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Visitors who ask their device for less motion get a still slideshow.
    _playing = !_prefersReducedMotion();
    _restartTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Starts the clock again from zero, so each slide gets its full time.
  ///
  /// It runs only in the browser (`kIsWeb`). During the build this component
  /// is rendered once, and a running timer would never let the build finish.
  void _restartTimer() {
    _timer?.cancel();
    _timer = kIsWeb && _playing ? Timer.periodic(_slideTime, (_) => _nextSlide()) : null;
  }

  void _nextSlide() {
    setState(() => _slide = (_slide + 1) % projectById(_selected).slides.length);
  }

  void _select(ProjectId id) {
    setState(() {
      _selected = id;
      _slide = 0;
    });
    _restartTimer();
  }

  void _showSlide(int slide) {
    setState(() {
      _slide = slide;
      _playing = false;
    });
    _restartTimer();
  }

  void _togglePlaying() {
    setState(() => _playing = !_playing);
    _restartTimer();
  }

  static bool _prefersReducedMotion() {
    return kIsWeb && web.window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  }

  @override
  Component build(BuildContext context) {
    final strings = Strings.of(component.languageCode);

    return div(
      classes: 'stage',
      [
        div(classes: 'stage-picker', [
          h2(id: 'stage-heading', [.text(strings.stageHeading)]),
          ProjectButtons(strings: strings, selected: _selected, onSelect: _select),
        ]),
        // Every project is rendered, and the others are hidden: their text is in
        // the HTML for search engines, and switching needs no loading.
        for (final project in projects) _panel(project, strings),
      ],
    );
  }

  /// The selected project gets the live slideshow; hidden ones rest on slide 1.
  Component _panel(Project project, Strings strings) {
    final shown = project.id == _selected;
    return ProjectPanel(
      project: project,
      strings: strings,
      shown: shown,
      slide: shown ? _slide : 0,
      playing: shown && _playing,
      onShowSlide: _showSlide,
      onTogglePlaying: _togglePlaying,
    );
  }
}
