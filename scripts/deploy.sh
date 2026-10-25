#!/usr/bin/env bash
# Deploy strideday to Cloudflare Workers (static assets).
# First time: run `npx wrangler login` once.
set -euo pipefail
cd "$(dirname "$0")/.."
command -v npx >/dev/null || { echo "Node.js (npx) is required: https://nodejs.org" >&2; exit 1; }
npx --yes wrangler@latest deploy "$@"
