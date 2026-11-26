import '../content/project.dart';
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

  @override
  String get stageHeading => "Ce que j'ai réalisé";
  @override
  String get projectChoiceLabel => 'Choisir un projet';
  @override
  String get problemLabel => 'Problème';
  @override
  String get builtLabel => 'Réalisation';
  @override
  String get resultLabel => 'Résultat';
  @override
  String get liveLinkLabel => "Ouvrir l'application";
  @override
  String get pauseLabel => 'Mettre le diaporama en pause';
  @override
  String get playLabel => 'Relancer le diaporama';
  @override
  String slideLabel(int number, int total) => 'Image $number sur $total';
  @override
  String screenAlt(String projectName, Screen screen) => switch (screen) {
    Screen.web => '$projectName sur le web',
    Screen.phone => '$projectName sur un téléphone',
  };

  @override
  ProjectText project(ProjectId id) => switch (id) {
    ProjectId.plotwatch => const ProjectText(
      kind: 'Dart full-stack',
      problem: "Ceux qui financent un chantier ne peuvent pas toujours s'y rendre.",
      built:
          'Une application Dart full-stack : Flutter, Serverpod 4, PostgreSQL. '
          'Chaque étape est prouvée par des photos vérifiées du chantier, puis '
          'validée par le propriétaire.',
      result:
          'En ligne sur le web. Réalisée pour le hackathon Serverpod, à partir '
          'de spécifications écrites et de tests.',
      slideCaptions: [
        "Sur le chantier, la photo est prise dans l'application. Sur le web, "
            'le propriétaire suit chaque étape.',
        "Chaque photo passe 8 contrôles avant que le propriétaire valide l'étape.",
        'Chaque dépense est enregistrée avec son reçu, étape par étape.',
        "Tout le projet en un coup d'œil, avec les dernières mises à jour.",
      ],
    ),
    ProjectId.pluslocate => const ProjectText(
      kind: 'Application mobile',
      problem: "Beaucoup de lieux au Cameroun n'ont pas d'adresse à partager.",
      built:
          "Une application Flutter qui trouve, enregistre et partage n'importe "
          'quel lieu sous forme de Plus Code, en anglais et en français.',
      result: 'Bientôt sur Google Play.',
      slideCaptions: [
        "Un Plus Code donne une adresse précise à n'importe quel lieu.",
        'Votre position en Plus Code, prête à copier, enregistrer ou partager.',
        'Recherchez un lieu ou un Plus Code.',
        'Les lieux enregistrés, à partager un par un ou plusieurs à la fois.',
      ],
    ),
  };
}
