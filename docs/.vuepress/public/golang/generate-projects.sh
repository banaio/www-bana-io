#!/usr/bin/env zsh
set -euf -o pipefail

# # For zsh
# setopt -s nullglob   # Non-matching globs are removed  ('*.foo' => '')
# setopt -s failglob   # Non-matching globs throw errors
# setopt -s nocaseglob # Case insensitive globs
# setopt -s globstar   # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')

echo "" >> projects.md
wget -O repos.json 'https://api.github.com/orgs/banaio/repos'
# NB: Remove spaces from beginning and end of description string
cat repos.json | jq -r \
  '
.[] |
select(.language == "Go") |
if (.description != null) then
  ("* **" + (.description | gsub("(^\\s+)|(\\s+$)";"")) + ":** [" + .html_url + "]" + "(" + .html_url + ")")
else
  ("* [" + .html_url + "]" + "(" + .html_url + ")")
end
' >> projects.md
