#!/usr/bin/env bash
# set -euo pipefail
set -euxo pipefail

caddy run --config ./docs/.vuepress/server/Caddyfile --adapter caddyfile 
