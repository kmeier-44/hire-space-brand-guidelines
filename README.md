# Hire Space Brand Guidelines

The working brand book for Hire Space in 2026. Voice, positioning, visual identity, logo, colour, typography, photography, iconography, elevation and the things we never say.

**Live site:** _(will be added once GitHub Pages is enabled)_

**Download as PDF:** [`hire-space-brand-guidelines.pdf`](./hire-space-brand-guidelines.pdf)

## What's inside

22 slides covering:

1. **Who we are** — what we are, our vision, brand promise, how we want clients to feel, the five messaging pillars, Hire Space vs Hire Space 360
2. **How we sound** — brand voice, AI writing rules, before/after examples, emoji guidance
3. **How we look** — logo and usage, colour palette, typography, elevation (drop shadows), photography, iconography

Built as a single self-contained HTML file that renders as a 22-page pdf-style deck.

## Viewing it

### Option A: open the HTML directly
Double-click `index.html` in Finder, or open it in a browser. Everything is self-contained except for:
- **Brandon Grotesque and Proxima Nova** — loaded from `https://hirespace.com/fonts/` (see font licensing below)
- **Hero photography** — loaded from the Hire Space HubSpot CDN (`https://content.hirespace.com/hubfs/newsletter-images/`)

Both work without any local setup; you just need an internet connection.

### Option B: run the local dev server
```bash
python3 -m http.server 4567 --directory .
# then open http://localhost:4567/
```

## Regenerating the downloadable PDF

The Download PDF button in the deck serves `hire-space-brand-guidelines.pdf`, which is a headless-Chrome-rendered snapshot of the live HTML. After any edit to `index.html`, regenerate it:

```bash
./generate-pdf.sh
```

Requires Google Chrome installed at the default macOS location and the dev server running at `http://localhost:4567`.

## Editing

`index.html` is one file, roughly 2,000 lines, with all CSS and markup inline. Slides are `<section class="slide" id="sN">` blocks. Each slide is locked to exactly 1280×800 px. If you add content that overflows, shrink it to fit or the clip will hide it.

Design tokens live in the `:root` block at the top of the `<style>` tag. Colour, shadow, typography and dimensions are all CSS custom properties. Change them there and the whole deck updates.

## Font licensing

The deck uses four typeface families:

| Family | Source | License |
|---|---|---|
| **Brandon Grotesque** | Loaded from `hirespace.com/fonts/` | Commercial (HVD Fonts via Adobe) — **not committed to this repo** |
| **Proxima Nova** | Loaded from `hirespace.com/fonts/` | Commercial (Mark Simonson Studio) — **not committed to this repo** |
| **Open Sans** | `fonts/open-sans-*.ttf` | SIL Open Font License — committed |
| **Work Sans** | `fonts/work-sans-*.ttf` | SIL Open Font License — committed |

Brandon Grotesque and Proxima Nova are commercial typefaces and cannot be redistributed from this repo. They are loaded at runtime from `https://hirespace.com/fonts/` where Hire Space self-hosts them with `Access-Control-Allow-Origin: *`, which means any domain (including this GitHub Pages deployment) can load them at runtime without copying the raw font files.

If `hirespace.com` is offline or the font endpoints change, the deck falls back to **Work Sans ExtraBold** (headings) and **Open Sans** (body) automatically — both of which are open-source and committed here.

`.gitignore` blocks `fonts/brandon-*`, `fonts/proxima-*` and related patterns so future commits cannot accidentally include the commercial files.

## Assets

- **Logos** (`assets/`) — PNG versions of the Hire Space and Hire Space 360 logos, sourced from the Master Logo Folder
- **Exclusion zone diagram** — extracted from the 2020 design guidelines PDF
- **Hero photography** — 5 cinematic venue photos generated via the `hire-space-newsletter` MCP using Gemini image generation, hosted on the Hire Space HubSpot CDN

## Related

- **The `brand-voice` skill** (`~/.claude/skills/brand-voice/SKILL.md`) — the authoritative version of Hire Space's writing rules, used by every AI-assisted copywriting workflow. This deck is a visual summary of that skill plus the visual-system rules.
- **The `hire-space-newsletter` MCP** — where the brand voice rules are also embedded as a `get_brand_voice` tool, for any client calling the newsletter workflow.
- **2026 messaging doc** — the underlying positioning document that drives the voice and pillars. Kept in Drive, not in this repo.

## Contributing

This repo is the source of truth for the deck but NOT for the brand voice rules themselves. Changes to voice/positioning should be discussed before implementation. Visual-system changes (colours, shadows, typography treatment) can be PR'd directly.

Last updated: 2026-04-15.
