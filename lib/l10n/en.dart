import '../content/project.dart';
import 'strings.dart';

class EnglishStrings extends Strings {
  const EnglishStrings();

  @override
  String get languageCode => 'en';
  @override
  String get homePath => '/';
  @override
  String get languageName => 'English';

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

  @override
  String get emailMeLabel => 'Email me';
  @override
  String get copyEmailLabel => 'Copy address';
  @override
  String get emailCopiedLabel => 'Address copied';
  @override
  String get cvLabel => 'CV (PDF, English)';

  @override
  String get stageHeading => 'Selected work';
  @override
  String get projectChoiceLabel => 'Choose a project';
  @override
  String get problemLabel => 'Problem';
  @override
  String get builtLabel => 'Built';
  @override
  String get resultLabel => 'Result';
  @override
  String get liveLinkLabel => 'Open the live app';
  @override
  String get pauseLabel => 'Pause the slideshow';
  @override
  String get playLabel => 'Play the slideshow';
  @override
  String slideLabel(int number, int total) => 'Slide $number of $total';
  @override
  String screenAlt(String projectName, Screen screen) => switch (screen) {
    Screen.web => '$projectName on the web',
    Screen.phone => '$projectName on a phone',
  };

  @override
  ProjectText project(ProjectId id) => switch (id) {
    ProjectId.plotwatch => const ProjectText(
      kind: 'Full-stack Dart',
      problem: "People who fund a building project often can't visit the site.",
      built:
          'A full-stack Dart app: Flutter, Serverpod 4, PostgreSQL. Each stage '
          'is proven with verified site photos, then approved by the owner.',
      result: 'Live on the web. Built for the Serverpod hackathon from written specs, test-first.',
      slideCaptions: [
        'On site, the photo is taken in the app. On the web, the owner follows every stage.',
        'Each photo passes 8 checks before the owner approves the stage.',
        'Every expense is recorded with its receipt, stage by stage.',
        'The whole project at a glance, with the latest updates.',
      ],
    ),
    ProjectId.pluslocate => const ProjectText(
      kind: 'Mobile app',
      problem: 'Many places in Cameroon have no street address to share.',
      built: 'A Flutter app that finds, saves and shares any location as a Plus Code, in English and French.',
      result: 'Coming soon to Google Play.',
      slideCaptions: [
        'A Plus Code gives an exact address to any place.',
        'Your position as a Plus Code, ready to copy, save or share.',
        'Search for a place or a Plus Code.',
        'Saved places, shared one at a time or several at once.',
      ],
    ),
  };
}
