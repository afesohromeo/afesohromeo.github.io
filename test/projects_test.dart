@TestOn('vm')
library;

import 'dart:io';

import 'package:jaspr_test/jaspr_test.dart';
import 'package:portfolio/content/project.dart';
import 'package:portfolio/content/projects.dart';
import 'package:portfolio/l10n/strings.dart';

// Plan: doc/01-site-plan.md, step 2, D-11 (browser and phone) and D-13
// (project text in Strings, screenshots named by one rule).

void main() {
  group('Given the projects on the stage', () {
    test('then Plotwatch comes first, then PlusLocate', () {
      expect(projects.map((project) => project.id), [ProjectId.plotwatch, ProjectId.pluslocate]);
    });

    test('then each has 3 or 4 slides', () {
      for (final project in projects) {
        expect(project.slides.length, inInclusiveRange(3, 4), reason: project.name);
      }
    });

    test('then Plotwatch shows a web and a phone screen, PlusLocate a phone screen', () {
      expect(projectById(ProjectId.plotwatch).screens, [Screen.web, Screen.phone]);
      expect(projectById(ProjectId.pluslocate).screens, [Screen.phone]);
    });
  });

  group('Given a screenshot path', () {
    test('then it names the project, language, slide number, slide and screen', () {
      final plotwatch = projectById(ProjectId.plotwatch);

      expect(
        plotwatch.screenshot(languageCode: 'fr', slide: 1, screen: Screen.web),
        '/images/projects/plotwatch/fr-2-verify-web.jpg',
      );
    });
  });

  for (final strings in Strings.all) {
    group('Given the ${strings.languageCode} text of each project', () {
      test('then there is one caption per slide', () {
        for (final project in projects) {
          final text = strings.project(project.id);

          expect(text.slideCaptions.length, project.slides.length, reason: project.name);
        }
      });

      test('then no line is empty', () {
        for (final project in projects) {
          final text = strings.project(project.id);

          for (final line in [text.kind, text.problem, text.built, text.result, ...text.slideCaptions]) {
            expect(line.trim(), isNotEmpty, reason: project.name);
          }
        }
      });
    });
  }

  test(
    'Given every slide, in every language, then its screenshots exist in web/',
    () {
      for (final project in projects) {
        for (final strings in Strings.all) {
          for (var slide = 0; slide < project.slides.length; slide++) {
            for (final screen in project.screens) {
              final path = project.screenshot(languageCode: strings.languageCode, slide: slide, screen: screen);

              expect(File('web$path').existsSync(), isTrue, reason: '$path is missing');
            }
          }
        }
      }
    },
  );
}
