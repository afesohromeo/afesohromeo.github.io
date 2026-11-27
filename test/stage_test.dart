@TestOn('vm')
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_test/server_test.dart';
import 'package:portfolio/components/stage/project_stage.dart';
import 'package:portfolio/content/project.dart';
import 'package:portfolio/content/projects.dart';
import 'package:portfolio/l10n/strings.dart';
import 'package:portfolio/site_document.dart';

// Plan: doc/01-site-plan.md, step 2, D-11 (browser and phone) and D-12
// (the selected project is local state).

void main() {
  for (final (path, strings) in [('/', Strings.en), ('/fr/', Strings.fr)]) {
    group('Given the stage on the page at $path', () {
      Future<DocumentResponse> get(ServerTester tester) {
        tester.pumpComponent(siteDocument());
        return tester.request(path);
      }

      testServer('then there is one button per project, and the first is pressed', (tester) async {
        final doc = (await get(tester)).document!;

        final buttons = doc.querySelectorAll('.stage .project-button');
        expect(buttons.map((element) => element.querySelector('.name')!.text.trim()), ['Plotwatch', 'PlusLocate']);
        expect(buttons.map((element) => element.attributes['aria-pressed']), ['true', 'false']);
        expect(buttons.first.attributes['aria-controls'], 'project-plotwatch');
      });

      testServer('then every project is in the HTML, and only the first is shown', (tester) async {
        final doc = (await get(tester)).document!;

        final plotwatch = doc.getElementById('project-plotwatch')!;
        final pluslocate = doc.getElementById('project-pluslocate')!;
        expect(plotwatch.attributes.containsKey('hidden'), isFalse);
        expect(pluslocate.attributes.containsKey('hidden'), isTrue);
        expect(pluslocate.text, contains(strings.project(ProjectId.pluslocate).problem));
      });

      testServer('then Plotwatch shows its first slide in a browser and a phone, loaded with the page', (
        tester,
      ) async {
        final doc = (await get(tester)).document!;
        final plotwatch = projectById(ProjectId.plotwatch);
        final panel = doc.getElementById('project-plotwatch')!;

        final current = panel.querySelectorAll('.slide.current img');
        expect(current.map((image) => image.attributes['src']), [
          plotwatch.screenshot(languageCode: strings.languageCode, slide: 0, screen: Screen.web),
          plotwatch.screenshot(languageCode: strings.languageCode, slide: 0, screen: Screen.phone),
        ]);
        expect(current.map((image) => image.attributes['loading']), [null, null]);
        expect(panel.querySelector('.browser-address')!.text, 'plotwatch.serverpod.space');
        expect(
          panel.querySelector('figcaption')!.text.trim(),
          strings.project(ProjectId.plotwatch).slideCaptions.first,
        );
      });

      testServer('then the other slides are in the HTML, hidden from screen readers and loaded later', (
        tester,
      ) async {
        final doc = (await get(tester)).document!;
        final slides = doc.getElementById('project-plotwatch')!.querySelectorAll('.slide');

        expect(slides, hasLength(4));
        for (final slide in slides.skip(1)) {
          expect(slide.attributes['aria-hidden'], 'true');
          expect(slide.querySelectorAll('img').map((image) => image.attributes['loading']), ['lazy', 'lazy']);
        }
      });

      testServer('then PlusLocate shows phones only, loaded when needed', (tester) async {
        final doc = (await get(tester)).document!;
        final panel = doc.getElementById('project-pluslocate')!;

        final images = panel.querySelectorAll('img');
        expect(images, hasLength(4));
        expect(images.map((image) => image.attributes['loading']), everyElement('lazy'));
        expect(panel.querySelector('.browser'), isNull);
      });

      testServer('then the slideshow has a pause button and one dot per slide', (tester) async {
        final doc = (await get(tester)).document!;
        final panel = doc.getElementById('project-plotwatch')!;

        expect(panel.querySelector('.play-pause')!.attributes['aria-label'], strings.pauseLabel);
        final dots = panel.querySelectorAll('.slide-dot');
        expect(dots.map((dot) => dot.attributes['aria-label']), [
          for (var number = 1; number <= 4; number++) strings.slideLabel(number, 4),
        ]);
        expect(dots.map((dot) => dot.attributes['aria-current']), ['true', null, null, null]);
      });

      testServer('then Plotwatch links to the live app, opening in a new tab', (tester) async {
        final doc = (await get(tester)).document!;

        final link = doc.getElementById('project-plotwatch')!.querySelector('a.live-link')!;
        expect(link.attributes['href'], 'https://plotwatch.serverpod.space');
        expect(link.attributes['target'], '_blank');
        expect(link.attributes['rel'], 'noopener');
        expect(link.text, contains(strings.liveLinkLabel));
      });
    });
  }

  group('Given the stage in the browser', () {
    const strings = Strings.en;
    final plotwatchCaptions = strings.project(ProjectId.plotwatch).slideCaptions;
    final pluslocateCaptions = strings.project(ProjectId.pluslocate).slideCaptions;

    testComponents('when PlusLocate is clicked, then it is pressed and shown instead', (tester) async {
      tester.pumpComponent(const ProjectStage(languageCode: 'en'));

      await tester.click(find.componentWithText(button, 'PlusLocate'));

      expect(_attributes(find.componentWithText(button, 'PlusLocate'))['aria-pressed'], 'true');
      expect(_attributes(find.componentWithText(button, 'Plotwatch'))['aria-pressed'], 'false');
      expect(_attributes(_panel('pluslocate')).containsKey('hidden'), isFalse);
      expect(_attributes(_panel('plotwatch')).containsKey('hidden'), isTrue);
    });

    testComponents('when the third dot is clicked, then the third slide shows and the slideshow stops', (
      tester,
    ) async {
      tester.pumpComponent(const ProjectStage(languageCode: 'en'));

      await tester.click(_inPanel('plotwatch', _dot(strings.slideLabel(3, 4))));

      expect(_attributes(_inPanel('plotwatch', _dot(strings.slideLabel(3, 4))))['aria-current'], 'true');
      expect(_inPanel('plotwatch', find.text(plotwatchCaptions[2])), findsOneComponent);
      expect(_attributes(_inPanel('plotwatch', _playPause()))['aria-label'], strings.playLabel);
    });

    testComponents('when pause is clicked, then it becomes play, and back', (tester) async {
      tester.pumpComponent(const ProjectStage(languageCode: 'en'));

      await tester.click(_inPanel('plotwatch', _playPause()));
      expect(_attributes(_inPanel('plotwatch', _playPause()))['aria-label'], strings.playLabel);

      await tester.click(_inPanel('plotwatch', _playPause()));
      expect(_attributes(_inPanel('plotwatch', _playPause()))['aria-label'], strings.pauseLabel);
    });

    testComponents('when another project is picked, then its slideshow starts at the first slide', (tester) async {
      tester.pumpComponent(const ProjectStage(languageCode: 'en'));

      await tester.click(_inPanel('plotwatch', _dot(strings.slideLabel(2, 4))));
      await tester.click(find.componentWithText(button, 'PlusLocate'));

      expect(_inPanel('pluslocate', find.text(pluslocateCaptions.first)), findsOneComponent);
      expect(_attributes(_inPanel('pluslocate', _dot(strings.slideLabel(1, 4))))['aria-current'], 'true');
    });
  });
}

Finder _panel(String id) => _domWhere((dom) => dom.id == 'project-$id');

Finder _inPanel(String id, Finder matching) => find.descendant(of: _panel(id), matching: matching);

Finder _dot(String label) => _domWhere((dom) => dom.tag == 'button' && dom.attributes?['aria-label'] == label);

Finder _playPause() => _domWhere((dom) => dom.classes == 'play-pause');

Finder _domWhere(bool Function(DomComponent dom) test) {
  return find.byElementPredicate((element) => element is DomElement && test(element.component));
}

/// The attributes of the one DOM element the finder points to.
Map<String, String> _attributes(Finder finder) {
  final element = finder.evaluate().single;
  final dom = element is DomElement ? element : _firstDomElement(element);
  return dom.component.attributes ?? const {};
}

DomElement _firstDomElement(Element element) {
  DomElement? found;
  void visit(Element child) {
    if (found != null) return;
    if (child is DomElement) {
      found = child;
    } else {
      child.visitChildren(visit);
    }
  }

  element.visitChildren(visit);
  return found!;
}
