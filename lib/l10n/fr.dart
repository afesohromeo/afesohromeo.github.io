import 'strings.dart';

class FrenchStrings extends Strings {
  const FrenchStrings();

  @override
  String get languageCode => 'fr';
  @override
  String get homePath => '/fr/';
  @override
  String get otherLanguageName => 'English';

  @override
  String get pageTitle => 'Afesoh Romeo, développeur Flutter';
  @override
  String get pageDescription =>
      'Développeur Flutter : applications mobiles, Dart full-stack avec '
      'Serverpod, et outils open source pour les développeurs Flutter.';

  @override
  String get eyebrow => 'Développeur Flutter · Mobile et Dart full-stack · Yaoundé, UTC+1';
  @override
  String get headlineStart => 'Je crée des applications Flutter,';
  @override
  String get headlineEnd => "et les outils que d'autres développeurs utilisent pour créer les leurs.";
  @override
  String get intro =>
      'Des applications mobiles en production, du Dart full-stack avec '
      'Serverpod, et des outils open source pour le développement Flutter '
      'assisté par IA.';
}
