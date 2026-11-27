import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../content/project.dart';
import '../../l10n/strings.dart';
import '../../styles/theme.dart';

/// A project's screenshots in their device: a phone, or a browser window with
/// a phone over its corner (D-11), and the slide's caption underneath.
///
/// The frames are drawn with CSS, so the screenshots are only the screens.
class DeviceFrame extends StatelessComponent {
  const DeviceFrame({
    required this.project,
    required this.strings,
    required this.slide,
    required this.eager,
    super.key,
  });

  final Project project;
  final Strings strings;

  /// The slide on show. Every slide is rendered, stacked in the same place;
  /// only the current one is visible.
  final int slide;

  /// Whether the first slide's images load with the page. The other slides,
  /// and every slide of a hidden project, load later (`loading="lazy"`).
  final bool eager;

  @override
  Component build(BuildContext context) {
    return figure(classes: 'device device-${project.layout.name}', [
      div(classes: 'slides', [
        for (var index = 0; index < project.slides.length; index++)
          div(
            classes: index == slide ? 'slide current' : 'slide',
            // Screen readers read only the slide on show.
            attributes: {if (index != slide) 'aria-hidden': 'true'},
            [
              div(classes: 'screens', [
                for (final screen in project.screens)
                  switch (screen) {
                    Screen.web => _browser(_screenshot(index, screen, width: 1280, height: 720)),
                    Screen.phone => _phone(_screenshot(index, screen, width: 540, height: 1140)),
                  },
              ]),
            ],
          ),
      ]),
      figcaption([.text(strings.project(project.id).slideCaptions[slide])]),
    ]);
  }

  Component _screenshot(int index, Screen screen, {required int width, required int height}) {
    return img(
      src: project.screenshot(languageCode: strings.languageCode, slide: index, screen: screen),
      alt: strings.screenAlt(project.name, screen),
      width: width,
      height: height,
      loading: eager && index == 0 ? null : .lazy,
    );
  }

  Component _browser(Component screenshot) {
    final address = Uri.parse(project.liveUrl!).host;
    return div(classes: 'browser', [
      // The bar is decoration: screen readers skip it.
      div(
        classes: 'browser-bar',
        attributes: {'aria-hidden': 'true'},
        [
          span(classes: 'browser-dots', []),
          span(classes: 'browser-address', [.text(address)]),
        ],
      ),
      screenshot,
    ]);
  }

  Component _phone(Component screenshot) => div(classes: 'phone', [screenshot]);

  @css
  static List<StyleRule> get styles => [
    css('.device', [
      css('&').styles(margin: .zero),
      css('img').styles(
        display: .block,
        width: 100.percent,
        height: .auto,
        raw: {'object-fit': 'cover', 'object-position': 'top'},
      ),
      css('figcaption').styles(
        margin: .only(top: 16.px),
        color: mutedColor,
        textAlign: .center,
        fontSize: 14.px,
      ),
      css('.screens').styles(position: .relative()),
    ]),

    // The slides share one grid cell, so they sit on top of each other and
    // the frame keeps its size. Changing slide fades between them.
    css('.slides').styles(display: .grid),
    css('.slide', [
      css('&').styles(
        opacity: 0,
        transition: Transition('opacity', duration: const Duration(milliseconds: 600)),
        raw: {'grid-area': '1 / 1'},
      ),
      css('&.current').styles(opacity: 1),
    ]),
    css.media(MediaQuery.raw('(prefers-reduced-motion: reduce)'), [
      css('.slide').styles(transition: Transition.unset),
    ]),

    // The phone: a dark rim with round corners, the shape of a 1080x2280 screen.
    css('.phone').styles(
      border: .all(color: const Color('#05070A'), width: 10.px),
      radius: .circular(44.px),
      overflow: .hidden,
      raw: {'box-shadow': '0 24px 60px rgba(0, 0, 0, 0.5), 0 0 0 1px #323741'},
    ),
    css('.phone img').styles(aspectRatio: AspectRatio(540, 1140)),
    css('.device-phone .phone').styles(
      maxWidth: 300.px,
      margin: .symmetric(horizontal: .auto),
    ),

    // The browser: a bar with three dots and the address, over a 16:9 screen.
    css('.browser').styles(
      border: .all(color: strongLineColor, width: 1.px),
      radius: .circular(12.px),
      overflow: .hidden,
      backgroundColor: const Color('#15181D'),
      raw: {'box-shadow': '0 24px 60px rgba(0, 0, 0, 0.45)'},
    ),
    css('.browser img').styles(aspectRatio: AspectRatio(16, 9)),
    css('.browser-bar').styles(
      display: .flex,
      padding: .symmetric(horizontal: 12.px, vertical: 9.px),
      alignItems: .center,
      gap: .all(12.px),
    ),
    css('.browser-dots').styles(
      width: 44.px,
      height: 10.px,
      raw: {
        'background':
            'radial-gradient(circle at 5px 5px, #FF5F57 4px, transparent 4.5px), '
            'radial-gradient(circle at 22px 5px, #FEBC2E 4px, transparent 4.5px), '
            'radial-gradient(circle at 39px 5px, #28C840 4px, transparent 4.5px)',
      },
    ),
    css('.browser-address').styles(
      padding: .symmetric(horizontal: 12.px, vertical: 4.px),
      radius: .circular(999.px),
      overflow: .hidden,
      flex: Flex(grow: 1),
      color: softTextColor,
      textAlign: .center,
      fontFamily: monoFont,
      fontSize: 12.px,
      textOverflow: .ellipsis,
      whiteSpace: .noWrap,
      backgroundColor: groundColor,
    ),

    // Browser and phone: the browser leaves room on the right, and the phone
    // sits over its bottom-right corner.
    css('.device-browserAndPhone .screens').styles(
      padding: .only(right: 14.percent, bottom: 8.percent),
    ),
    css('.device-browserAndPhone .phone').styles(
      position: .absolute(right: .zero, bottom: .zero),
      width: 24.percent,
      border: .all(color: const Color('#05070A'), width: 5.px),
      radius: .circular(20.px),
    ),

    // Beside the text (wide screens), the device column takes the device's
    // own width: 560px for a browser and phone, 300px for a phone alone.
    css.media(MediaQuery.screen(minWidth: 1040.px), [
      css('.device-browserAndPhone').styles(width: 560.px),
      css('.device-phone').styles(width: 300.px),
    ]),
  ];
}
