/// The shape of a project on the stage (doc/01-site-plan.md, D-13).
///
/// Only language-free facts live here. The words about a project (problem,
/// what was built, result, slide captions) are in `Strings.project`, so the
/// French text can't be forgotten (D-3).
library;

/// Every project on the stage. Adding one here makes the compiler ask for its
/// text in each language, because `Strings.project` switches over this enum.
enum ProjectId { plotwatch, pluslocate }

/// How a project's screenshots are framed.
enum Layout {
  /// A phone app: one phone screen per slide.
  phone,

  /// An app used on the web and on phones: a browser window with a phone
  /// over its corner, both showing the same moment (D-11).
  browserAndPhone,
}

/// One device in a frame.
enum Screen { web, phone }

/// One moment in a project's slideshow, such as 'capture' or 'map'.
class Slide {
  const Slide(this.name);

  /// Used in the screenshot file names; lowercase, no spaces.
  final String name;
}

class Project {
  const Project({
    required this.id,
    required this.name,
    required this.layout,
    required this.slides,
    this.liveUrl,
  });

  final ProjectId id;

  /// The product name. It's the same in every language, so it isn't in Strings.
  final String name;

  final Layout layout;
  final List<Slide> slides;

  /// Where visitors can try it, when it's public.
  final String? liveUrl;

  /// The screens each slide has, in the order they are drawn: the browser
  /// behind, the phone in front.
  List<Screen> get screens => switch (layout) {
    Layout.phone => const [Screen.phone],
    Layout.browserAndPhone => const [Screen.web, Screen.phone],
  };

  /// The address of one screenshot, as served from `web/`. The naming rule:
  /// `/images/projects/<project>/<language>-<number>-<slide>-<screen>.jpg`,
  /// numbered from 1, for example `/images/projects/plotwatch/fr-2-verify-web.jpg`.
  String screenshot({required String languageCode, required int slide, required Screen screen}) {
    return '/images/projects/${id.name}/$languageCode-${slide + 1}-${slides[slide].name}-${screen.name}.jpg';
  }
}
