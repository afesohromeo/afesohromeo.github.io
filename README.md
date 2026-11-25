# afesohromeo.github.io

Source of [afesohromeo.github.io](https://afesohromeo.github.io), the portfolio of Afesoh Romeo, Flutter developer.

Built with [Jaspr](https://jaspr.site), a Dart web framework, in static mode: each page is pre-rendered to plain HTML, and only the interactive parts run code in the browser. English at `/`, French at `/fr/`.

The plan and its decisions: [doc/01-site-plan.md](doc/01-site-plan.md).

## Run it

```shell
dart pub global activate jaspr_cli 0.23.5
jaspr serve
```

## Check and build

```shell
dart analyze
dart test
jaspr build            # writes the site to build/jaspr
```

`jaspr build` starts a temporary server on port 8080 to render the pages. If that port is taken, pass another one: `jaspr build --port 8099`.

## Troubleshooting

**`Failed to create server socket ... port = 8099` (or 8080, 8181).** A server from an earlier `jaspr serve` or `jaspr build` is still running. On Windows, stopping the CLI with Ctrl+C can leave its server behind: the server keeps the site's port, and its debugger service keeps port 8181. Stop whatever is listening on those ports, then start again:

```powershell
Get-NetTCPConnection -LocalPort 8099,8181 -State Listen | ForEach-Object { Stop-Process -Id $_.OwningProcess }
```

Check first that nothing else you need is using port 8181. It is also the default debugger port for other Dart programs, such as `flutter run`.

## Publishing

Every push to `main` is built, tested and published to GitHub Pages by [the workflow](.github/workflows/deploy.yml). Pull requests are built and tested but not published.

## Where things are

| Path | What |
|------|------|
| `lib/l10n/` | All text: `strings.dart` (the list), `en.dart`, `fr.dart` |
| `lib/pages/home_page.dart` | The page: `<head>` and the sections in order |
| `lib/components/` | One file per section |
| `lib/styles/theme.dart` | Colours, fonts, global styles |
| `web/` | Files served as-is: images, favicon, sitemap |
