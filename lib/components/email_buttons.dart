import 'dart:async';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

import '../l10n/strings.dart';
import '../styles/theme.dart';

/// "Email me" and "Copy address" (doc/01-site-plan.md, D-5).
///
/// Robots collect email addresses by reading pages' HTML. So the address is
/// never written into the HTML: not as text, not in a link. It is put
/// together here, in the browser, only when a visitor clicks. That's also
/// why it isn't a parameter: a `@client` component's parameters are written
/// into the HTML.
@client
class EmailButtons extends StatefulComponent {
  const EmailButtons({required this.languageCode, super.key});

  final String languageCode;

  @override
  State<EmailButtons> createState() => _EmailButtonsState();

  @css
  static List<StyleRule> get styles => [
    // The buttons sit in the contact row as if this wrapper weren't there.
    css('.email-buttons').styles(display: .contents),
    css('.contact .email-me', [
      css('&').styles(
        border: .all(color: accentColor, width: 1.px),
        cursor: .pointer,
        color: groundColor,
        fontWeight: .w600,
        backgroundColor: accentColor,
      ),
      css('&:hover').styles(backgroundColor: const Color('#E3C252')),
    ]),
    css('.contact .copy-email').styles(cursor: .pointer, backgroundColor: Colors.transparent),
  ];
}

class _EmailButtonsState extends State<EmailButtons> {
  /// In two parts, joined only when needed.
  static String get _address => ['afesohromeo', 'gmail.com'].join('@');

  var _copied = false;
  Timer? _resetCopied;

  @override
  void dispose() {
    _resetCopied?.cancel();
    super.dispose();
  }

  void _emailMe() {
    if (kIsWeb) web.window.location.href = 'mailto:$_address';
  }

  void _copy() {
    if (kIsWeb) web.window.navigator.clipboard.writeText(_address);
    setState(() => _copied = true);
    // After a few seconds the button reads "Copy address" again.
    _resetCopied?.cancel();
    if (kIsWeb) _resetCopied = Timer(const Duration(seconds: 3), () => setState(() => _copied = false));
  }

  @override
  Component build(BuildContext context) {
    final strings = Strings.of(component.languageCode);

    return div(classes: 'email-buttons', [
      button(type: .button, classes: 'email-me', onClick: _emailMe, [.text(strings.emailMeLabel)]),
      button(
        type: .button,
        classes: 'copy-email',
        onClick: _copy,
        // aria-live: screen readers announce the change to "Address copied".
        [
          span(
            attributes: {'aria-live': 'polite'},
            [
              .text(_copied ? strings.emailCopiedLabel : strings.copyEmailLabel),
            ],
          ),
        ],
      ),
    ]);
  }
}
