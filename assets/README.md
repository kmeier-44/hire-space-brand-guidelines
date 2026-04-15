# Brand guidelines · assets drop-in folder

This folder is where the real Hire Space brand assets go. The `index.html` deck references these filenames; if a file is missing the deck falls back to an inline SVG approximation so the deck still works, but the real artwork should replace the fallback before shipping.

## What to drop in

From the **Hire Space Logos** Drive folder (`https://drive.google.com/drive/folders/1ZH4jSssDa9aMpisfGXLz9EO4oM_wKyyd`):

| Filename expected here | Source in Drive |
|---|---|
| `logo-primary.svg` | Full-colour logo (green mark + "HIRE SPACE" wordmark) on transparent background |
| `logo-mono-dark.svg` | Black monochrome version for use on white |
| `logo-mono-light.svg` | White monochrome version for use on dark |
| `logo-mark.svg` | Just the green circle + house icon, no wordmark |
| `logo-360-primary.svg` | Hire Space 360 full-colour lockup (from `/360/Logo/` sub-folder) |
| `logo-360-mono-light.svg` | White 360 lockup for dark backgrounds |

**SVG is preferred** (scales cleanly, small file size). PNG at 2x is an acceptable fallback if an SVG isn't available — rename to `.svg.png` and update the `<img>` `src` in `index.html`.

## Why this isn't automated

I tried to fetch the logos directly from the Drive folder but hit two walls:

1. **The Drive MCP connector this assistant uses only parses Google Docs format.** It can't return binary files (PNG, SVG, PDF, docx). Searches that filter by image mime type return nothing.
2. **The folder isn't publicly shared**, so anonymous `curl` on a Drive `uc?export=download` URL hits a Google sign-in page instead of the file.

Options to fix this for future runs:
- **Drop files in manually** (simplest, what this README is for).
- **Make the Logos folder shareable** ("Anyone with the link: Viewer") so the assistant can grab specific files by ID via curl.
- **Export the logos once into the project repo** and commit them alongside the deck so the assistant always has local access.

## Other assets used by the deck

The deck also uses 5 AI-generated hero photos hosted on HubSpot Files at:

```
https://content.hirespace.com/hubfs/newsletter-images/bg-cover-hero-v2-1200x675.jpg
https://content.hirespace.com/hubfs/newsletter-images/bg-photography-accent-1200x675.jpg
https://content.hirespace.com/hubfs/newsletter-images/bg-photo-candid-networking-1200x675.jpg
https://content.hirespace.com/hubfs/newsletter-images/bg-photo-architecture-1200x675.jpg
https://content.hirespace.com/hubfs/newsletter-images/bg-photo-360-premium-1200x675.jpg
```

These were generated via the `hire-space-newsletter` MCP's `generate_ai_image` tool with a cinematic editorial photography style. They're placeholders. For the final deck, swap these for real Hire Space venue photography from the Stock Images Drive folder.
