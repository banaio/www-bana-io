#!/usr/bin/env bash
# GNU bash, version 5.0.17(1)-release (x86_64-pc-linux-gnu)
# Copyright (C) 2019 Free Software Foundation, Inc.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

# This is free software; you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.

# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail

set -o noclobber    # Avoid overlay files (echo "hi" > foo)
set -o errexit      # Used to exit upon error, avoiding cascading errors
set -o pipefail     # Unveils hidden failures
set -o nounset      # Exposes unset variables

# set -o nullglob     # Non-matching globs are removed  ('*.foo' => '')
shopt -s nullglob   # Non-matching globs are removed  ('*.foo' => '')
# set -o failglob     # Non-matching globs throw errors
shopt -s failglob   # Non-matching globs throw errors
# set -o nocaseglob   # Case insensitive globs
shopt -s nocaseglob # Case insensitive globs
# set -o globstar     # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')
shopt -s globstar # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')

BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
MISC="\033[92m"
RESET="\033[0m"

SCRIPT_NAME="$(basename ${0})"

function run() {
  printf "%b" "${GREEN}" "  ---> ${SCRIPT_NAME}: " "\t" "STARTED ..." "${RESET}" "\n"

  printf "%b" "${GREEN}" "  ---> ${SCRIPT_NAME}: " "\t" "FINISHED ..." "${RESET}" "\n"
}

run
