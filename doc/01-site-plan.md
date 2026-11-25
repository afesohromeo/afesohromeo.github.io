# Portfolio site: plan

> **Status:** approved by the developer on 2026-11-24.
> **For:** the developer, and any AI session continuing this work. Read this before changing the site.

## 1. What the site is

One page, in English and French, that shows two things at a glance: Flutter apps that are live, and tools other developers use.

- **Opening:** the logo, one headline, and contact right there: email, GitHub, LinkedIn, and the CV download (PDF, English only). There's no separate contact page.
- **The stage:** a row of project buttons. Picking one changes the device beside it (a phone for mobile apps, a browser window for web apps) and three lines: problem, what was built, result. Each device plays a slideshow of 3–4 real screenshots.
- **Tools for developers:** terminal-style cards for flutter-bloc-skills and flutter_bloc_kit, each with its install command and a copy button.
- **Also shipped to Google Play:** a small strip of store links (SENNACARE, Aurore ERP, Data Central). There's no employer history.
- **Footer:** the logo, "Built with Jaspr, in Dart", and a link to this repo.
- **The signature, "View source":** a switch that shows, under each section, the Dart code that renders it.

Left out on purpose: experience pages, a contact page, long text.

## 2. Decisions

| # | Decision | Why |
|---|----------|-----|
| D-1 | **Jaspr 0.23, static mode** (multi-page routing) | Dart, like the rest of the developer's work. Pages are built once as plain HTML, so they load fast and search engines read them; only the interactive parts (`@client` components) run code in the browser. Flutter Web was ruled out: slow first load, poor indexing. |
| D-2 | **English at `/`, French at `/fr/`**, each a real page | Both languages are indexed and each can be linked directly. The switch is a plain link. |
| D-3 | **All text in one `Strings` interface, with an English and a French implementation** | A missing French sentence is a compile error, so the languages can't drift apart. |
| D-4 | **View source shows the real files**, read when the site is built | What visitors see is always the code that runs, never a copy that goes stale. |
| D-5 | **The email address never appears in the HTML**. It's assembled in the browser when someone clicks "Email me" or "Copy" | Robots that harvest addresses from pages can't collect it. A test fails if the address ever appears in the built HTML. |
| D-6 | **GitHub Pages, deployed by GitHub Actions on every merge to `main`** | Free. A `<user>.github.io` repo serves at the root address. Work happens on branches; merging publishes. |
| D-7 | **The 2022 Flutter starter files are removed**; the history is kept | They were an unused counter app. |
| D-8 | **Look: dark ground, the logo's gold as the accent**; Space Grotesk headings, Inter body, JetBrains Mono for code | Approved in the design mockup (2026-11-24). The headline is kept as is for now and revisited in step 5. |
| D-9 | **Logo: the existing render, shown as a rounded badge** | The original Blender file may be lost. A render with a transparent background can replace the badge later. |
| D-10 | **Screenshots as a slideshow, not video** | Sharper and lighter, easy to update, and easy to swap for French versions. |

## 3. Steps

| # | Step | Result |
|---|------|--------|
| 1 | Project set up, EN and FR pages, automatic publishing | A simple first page live at afesohromeo.github.io |
| 2 | Opening section, project buttons, device frames, real screenshots | The main part of the page, working |
| 3 | Tool cards, shipped-apps strip, footer, email | The page complete |
| 4 | View source | The signature feature |
| 5 | Design pass with the real content: movement, headline, details | The finished look |

Each step: tests first for the interactive parts, then the code, then `dart analyze` and the tests pass before the step is called done.

## 4. Quality bar

- Keyboard access; text contrast at least 4.5:1.
- The slideshow stays still when the visitor's device asks for reduced motion.
- Page title, description, `hreflang` links between the two languages, and a preview image for links shared on LinkedIn or WhatsApp.
- Works at phone width with no sideways scrolling.

## 5. Content needed from the developer

| Item | Status |
|------|--------|
| Logo | Received: the WhatsApp render (`web/images/logo.jpg`) |
| PlusLocate: 3–4 phone screenshots (French too if possible) | Waiting |
| Plotwatch: 3–4 screenshots of the live web app, about 1280 px wide | Waiting |
| CV, English PDF | Waiting (after the developer's edits) |
| LinkedIn link | Waiting |
| The email address the site shows | Waiting |
| Google Play links for SENNACARE, Aurore ERP, Data Central | Taken from the CV |
