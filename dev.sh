#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail

rm -rv docs/.temp || true
rm -rv docs/.cache || true
rm -rv docs/.vuepress/dist || true

rm -rv "$(find ./docs/.vuepress/public -mindepth 1 -maxdepth 1 -type d \! \( -iname cv -o -iname fonts -o -iname static \))"

# npx vuepress dev docs --cache docs/.cache --temp docs/.temp --no-clear-screen --no-cache --debug
yarn docs:dev
