import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../l10n/strings.dart';
import '../../styles/theme.dart';

/// The slideshow's pause/play button and one dot per slide.
///
/// A slideshow that moves by itself must let visitors stop it (WCAG 2.2.2),
/// so the pause button is always there. Picking a dot also stops it: the
/// visitor has chosen what to look at.
class SlideControls extends StatelessComponent {
  const SlideControls({
    required this.strings,
    required this.count,
    required this.current,
    required this.playing,
    required this.onShowSlide,
    required this.onTogglePlaying,
    super.key,
  });

  final Strings strings;
  final int count;
  final int current;
  final bool playing;
  final void Function(int slide) onShowSlide;
  final void Function() onTogglePlaying;

  @override
  Component build(BuildContext context) {
    return div(classes: 'slide-controls', [
      button(
        type: .button,
        classes: 'play-pause',
        attributes: {'aria-label': playing ? strings.pauseLabel : strings.playLabel},
        onClick: onTogglePlaying,
        // The symbol is decoration: screen readers read the label instead.
        [
          span(attributes: {'aria-hidden': 'true'}, [.text(playing ? '❚❚' : '▶')]),
        ],
      ),
      for (var slide = 0; slide < count; slide++)
        button(
          type: .button,
          classes: 'slide-dot',
          attributes: {
            'aria-label': strings.slideLabel(slide + 1, count),
            if (slide == current) 'aria-current': 'true',
          },
          onClick: () => onShowSlide(slide),
          [],
        ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.slide-controls', [
      css('&').styles(
        display: .flex,
        margin: .only(top: 12.px),
        justifyContent: .center,
        alignItems: .center,
        gap: .all(4.px),
      ),
      // Each control is a 32px target; the dot inside is drawn smaller.
      css('button').styles(
        display: .inlineFlex,
        width: 32.px,
        height: 32.px,
        padding: .zero,
        border: .none,
        radius: .circular(999.px),
        cursor: .pointer,
        justifyContent: .center,
        alignItems: .center,
        color: softTextColor,
        fontSize: 11.px,
        backgroundColor: Colors.transparent,
      ),
      css('button:hover').styles(color: textColor),
      css('.slide-dot::before').styles(
        content: '',
        display: .block,
        width: 8.px,
        height: 8.px,
        radius: .circular(999.px),
        backgroundColor: strongLineColor,
      ),
      css('.slide-dot:hover::before').styles(backgroundColor: mutedColor),
      css('.slide-dot[aria-current="true"]::before').styles(width: 22.px, backgroundColor: accentColor),
    ]),
  ];
}
