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

        final buttons = doc.querySelectorAll('.stage button');
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

      testServer('then Plotwatch shows its first slide in a browser and a phone', (tester) async {
        final doc = (await get(tester)).document!;
        final plotwatch = projectById(ProjectId.plotwatch);
        final panel = doc.getElementById('project-plotwatch')!;

        final images = panel.querySelectorAll('img');
        expect(images.map((image) => image.attributes['src']), [
          plotwatch.screenshot(languageCode: strings.languageCode, slide: 0, screen: Screen.web),
          plotwatch.screenshot(languageCode: strings.languageCode, slide: 0, screen: Screen.phone),
        ]);
        expect(panel.querySelector('.browser-address')!.text, 'plotwatch.serverpod.space');
        expect(
          panel.querySelector('figcaption')!.text.trim(),
          strings.project(ProjectId.plotwatch).slideCaptions.first,
        );
      });

      testServer('then PlusLocate shows a phone only, loaded when needed', (tester) async {
        final doc = (await get(tester)).document!;
        final panel = doc.getElementById('project-pluslocate')!;

        final images = panel.querySelectorAll('img');
        expect(images, hasLength(1));
        expect(images.single.attributes['loading'], 'lazy');
        expect(panel.querySelector('.browser'), isNull);
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
    testComponents('when PlusLocate is clicked, then it is pressed and shown instead', (tester) async {
      tester.pumpComponent(const ProjectStage(languageCode: 'en'));

      await tester.click(find.componentWithText(button, 'PlusLocate'));

      expect(_attributes(find.componentWithText(button, 'PlusLocate'))['aria-pressed'], 'true');
      expect(_attributes(find.componentWithText(button, 'Plotwatch'))['aria-pressed'], 'false');
      expect(_attributes(_panel('pluslocate')).containsKey('hidden'), isFalse);
      expect(_attributes(_panel('plotwatch')).containsKey('hidden'), isTrue);
    });
  });
}

Finder _panel(String id) {
  return find.byElementPredicate(
    (element) => element is DomElement && element.component.id == 'project-$id',
  );
}

/// The attributes of the one DOM element the finder points to.
Map<String, String> _attributes(Finder finder) {
  final element = finder.evaluate().single;
  final dom = element is DomElement ? element : _firstDomElement(element);
  return (dom.renderObject as TestRenderElement).attributes ?? const {};
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
