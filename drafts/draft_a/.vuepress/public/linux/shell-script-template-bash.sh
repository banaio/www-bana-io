#!/usr/bin/env bash
# Tested against Bash 4.4.23(1)-release
set -eu -o pipefail

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
shopt -s globstar   # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')
