import 'package:jaspr/dom.dart';

// The look approved in the design mockup (doc/01-site-plan.md, D-8):
// a dark ground with the logo's gold as the one accent.

const groundColor = Color('#0D0F12');
const textColor = Color('#EDEEF0');
const softTextColor = Color('#B8BEC7');
const mutedColor = Color('#9AA1AC');
const lineColor = Color('#262A31');
const strongLineColor = Color('#323741');
const accentColor = Color('#D4B03C');

const headingFont = FontFamily.list([FontFamily('Space Grotesk'), FontFamilies.sansSerif]);
const bodyFont = FontFamily.list([FontFamily('Inter'), FontFamilies.systemUi, FontFamilies.sansSerif]);
const monoFont = FontFamily.list([FontFamily('JetBrains Mono'), FontFamilies.monospace]);

const contentWidth = Unit.pixels(1200);

/// The fonts, loaded by the document's `<head>`.
const fontsUrl =
    'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600'
    '&family=JetBrains+Mono:wght@400;500&family=Space+Grotesk:wght@500;700&display=swap';

@css
List<StyleRule> get globalStyles => [
  css('html, body').styles(
    minHeight: 100.vh,
    padding: .zero,
    margin: .zero,
    color: textColor,
    fontFamily: bodyFont,
    fontSize: 16.px,
    lineHeight: 1.55.em,
    backgroundColor: groundColor,
  ),
  css('*, *::before, *::after').styles(boxSizing: .borderBox),
  css('a:focus-visible, button:focus-visible').styles(
    outline: .new(color: accentColor, style: .solid, width: OutlineWidth(2.px), offset: 3.px),
  ),
];
