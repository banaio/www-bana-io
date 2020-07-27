#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail
set -x

# set -euo pipefail
#set -euxo pipefail

caddy run --config ./docs/.vuepress/server/Caddyfile --adapter caddyfile 
