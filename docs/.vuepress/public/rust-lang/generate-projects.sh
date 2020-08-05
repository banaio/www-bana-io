#!/usr/bin/env zsh
set -euf -o pipefail

# # For zsh
# setopt -s nullglob   # Non-matching globs are removed  ('*.foo' => '')
# setopt -s failglob   # Non-matching globs throw errors
# setopt -s nocaseglob # Case insensitive globs
# setopt -s globstar   # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')

wget -O repos.json 'https://api.github.com/orgs/banaio/repos'
cat repos.json | jq -r '.[] | select(.language == "Rust") | ("* **" + .description + ":** [" + .html_url + "]" + "(" + .html_url + ")")'
# * **Open Banking client written in Rust Programming Language.:** [https://github.com/banaio/openbanking.rs](https://github.com/banaio/openbanking.rs)
# * **All things written in Rust Programming Language.:** [https://github.com/banaio/bana.rs](https://github.com/banaio/bana.rs)
