/// The words about one project, in one language (doc/01-site-plan.md, D-13).
class ProjectText {
  const ProjectText({
    required this.kind,
    required this.problem,
    required this.built,
    required this.result,
    required this.slideCaptions,
  });

  /// A short label on the project button, such as 'Android'.
  final String kind;

  final String problem;
  final String built;
  final String result;

  /// One per slide, in slide order. Shown under the device as its caption
  /// (`<figcaption>`), which screen readers also read with the screenshots.
  final List<String> slideCaptions;
}
