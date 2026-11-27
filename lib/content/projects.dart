import 'project.dart';

/// The projects on the stage, in the order of their buttons.
const projects = [
  Project(
    id: ProjectId.plotwatch,
    name: 'Plotwatch',
    layout: Layout.browserAndPhone,
    liveUrl: 'https://plotwatch.serverpod.space',
    slides: [Slide('capture'), Slide('verify'), Slide('money'), Slide('overview')],
  ),
  Project(
    id: ProjectId.pluslocate,
    name: 'PlusLocate',
    layout: Layout.phone,
    slides: [Slide('welcome'), Slide('map'), Slide('search'), Slide('saved')],
  ),
];

Project projectById(ProjectId id) => projects.firstWhere((project) => project.id == id);
