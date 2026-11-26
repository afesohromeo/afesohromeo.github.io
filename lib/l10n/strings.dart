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

  /// The `lang` code of the page.
  String get languageCode;

  /// Where this language's page lives (D-2).
  String get homePath;

  /// The name of the *other* language, shown on the switch in that language.
  String get otherLanguageName;

  String get pageTitle;
  String get pageDescription;

  String get eyebrow;
  String get headlineStart;
  String get headlineEnd;
  String get intro;

  /// The words about each project on the stage (D-13).
  ProjectText project(ProjectId id);
}
