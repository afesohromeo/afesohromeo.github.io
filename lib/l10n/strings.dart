import '../content/project.dart';
import 'en.dart';
import 'fr.dart';
import 'project_text.dart';

export 'project_text.dart';

/// Every piece of text on the site (doc/01-site-plan.md, D-3).
///
/// Each language implements all of it, so a missing translation is a
/// compile error.
abstract class Strings {
  const Strings();

  static const Strings en = EnglishStrings();
  static const Strings fr = FrenchStrings();

  /// Every language the site is built in; English first (the default).
  static const List<Strings> all = [en, fr];

  /// The language with this code. `@client` components receive the code, not
  /// the [Strings] object, because their parameters must be plain data.
  static Strings of(String languageCode) => all.firstWhere((strings) => strings.languageCode == languageCode);

  /// The `lang` code of the page.
  String get languageCode;

  /// Where this language's page lives (D-2).
  String get homePath;

  /// This language's name, in itself: read by screen readers on the EN | FR switch.
  String get languageName;

  String get pageTitle;
  String get pageDescription;

  String get eyebrow;
  String get headlineStart;
  String get headlineEnd;
  String get intro;

  // The contact row in the opening.
  String get emailMeLabel;
  String get copyEmailLabel;
  String get emailCopiedLabel;
  String get cvLabel;

  // The stage (step 2).
  String get stageHeading;

  /// Read by screen readers for the row of project buttons.
  String get projectChoiceLabel;

  String get problemLabel;
  String get builtLabel;
  String get resultLabel;
  String get liveLinkLabel;

  // The slideshow.
  String get pauseLabel;
  String get playLabel;

  /// Read by screen readers for a slide's dot, such as "Slide 2 of 4".
  String slideLabel(int number, int total);

  /// The alt text of a screenshot, such as "Plotwatch on a phone".
  String screenAlt(String projectName, Screen screen);

  /// The words about each project on the stage (D-13).
  ProjectText project(ProjectId id);
}
