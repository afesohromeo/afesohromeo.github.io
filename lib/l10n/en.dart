import 'strings.dart';

class EnglishStrings extends Strings {
  const EnglishStrings();

  @override
  String get languageCode => 'en';
  @override
  String get homePath => '/';
  @override
  String get otherLanguageName => 'Français';

  @override
  String get pageTitle => 'Afesoh Romeo, Flutter developer';
  @override
  String get pageDescription =>
      'Flutter developer building mobile apps, full-stack Dart with Serverpod, '
      'and open-source tools for Flutter developers.';

  @override
  String get eyebrow => 'Flutter developer · Mobile and full-stack Dart · Yaoundé, UTC+1';
  @override
  String get headlineStart => 'I build Flutter apps,';
  @override
  String get headlineEnd => 'and the tools other developers use to build theirs.';
  @override
  String get intro =>
      'Mobile apps in production, full-stack Dart with Serverpod, and '
      'open-source tooling for AI-assisted Flutter development.';
}
