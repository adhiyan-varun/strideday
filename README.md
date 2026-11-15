# strideday

A personal tracker for learning to skate: daily exercises (reps and timed), a manual lap timer, a multi-person stopwatch (1 to 4, default 2), and progress views.
Single-file vanilla HTML/CSS/JS, no build step, no framework. Data is stored in `localStorage` under `strideday:v1`.

Live at https://strideday.adhiyan.in (Cloudflare Workers, static assets).

## Layout

- `public/index.html` – the whole app
- `wrangler.jsonc` – Workers static-assets config and custom domain
- `scripts/deploy.sh` – deploy script

## Run locally

    npx wrangler dev        # serves public/ on http://localhost:8787
    # or: python3 -m http.server -d public 8787

## Deploy

Requires Node.js 18+ and a Cloudflare account that hosts the `adhiyan.in` zone.

    npx wrangler login      # once
    ./scripts/deploy.sh

The `routes` entry in `wrangler.jsonc` attaches `strideday.adhiyan.in` as a Custom Domain;
Cloudflare creates the DNS record and certificate automatically on first deploy.

## Data shape

    { ex: [{id, name, type: "count"|"time", target}],
      log: { "YYYY-MM-DD": { exId: value } },   // time values are seconds
      laps: [{d, len, splits: [ms]}],
      len }
