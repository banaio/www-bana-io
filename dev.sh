#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail

rm -rv docs/.temp || true
rm -rv docs/.cache || true

# npx vuepress dev docs --cache docs/.cache --temp docs/.temp --no-clear-screen --no-cache --debug
yarn docs:dev

