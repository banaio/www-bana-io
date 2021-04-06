#!/usr/bin/env zsh
set -euf -o pipefail

curl \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  'https://api.github.com/orgs/banaio/repos?per_page=100'

# curl 'https://api.github.com/orgs/banaio/repos' \
#   -H 'Connection: keep-alive' \
#   -H 'Pragma: no-cache' \
#   -H 'Cache-Control: no-cache' \
#   -H 'DNT: 1' \
#   -H 'Upgrade-Insecure-Requests: 1' \
#   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36' \
#   -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
#   -H 'Sec-Fetch-Site: none' \
#   -H 'Sec-Fetch-Mode: navigate' \
#   -H 'Sec-Fetch-User: ?1' \
#   -H 'Sec-Fetch-Dest: document' \
#   -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8,ar;q=0.7,fr;q=0.6' \
#   -H 'Cookie: _octo=GH1.1.419877753.1574418903; tz=Europe%2FLondon; logged_in=yes; dotcom_user=mbana' \
#   --compressed ;
# curl 'https://api.github.com/favicon.ico' \
#   -H 'Referer: https://api.github.com/orgs/banaio/repos' \
#   --compressed

# fetch("https://api.github.com/orgs/banaio/repos", {
#   "headers": {
#     "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
#     "accept-language": "en-GB,en-US;q=0.9,en;q=0.8,ar;q=0.7,fr;q=0.6",
#     "cache-control": "no-cache",
#     "pragma": "no-cache",
#     "sec-fetch-dest": "document",
#     "sec-fetch-mode": "navigate",
#     "sec-fetch-site": "none",
#     "sec-fetch-user": "?1",
#     "upgrade-insecure-requests": "1",
#     "cookie": "_octo=GH1.1.419877753.1574418903; tz=Europe%2FLondon; logged_in=yes; dotcom_user=mbana"
#   },
#   "referrerPolicy": "no-referrer-when-downgrade",
#   "body": null,
#   "method": "GET",
#   "mode": "cors"
# }); ;
# fetch("https://api.github.com/favicon.ico", {
#   "referrer": "https://api.github.com/orgs/banaio/repos",
#   "referrerPolicy": "strict-origin-when-cross-origin",
#   "body": null,
#   "method": "GET",
#   "mode": "cors"
# });

# GET /orgs/banaio/repos HTTP/1.1
# Host: api.github.com
# Connection: keep-alive
# Pragma: no-cache
# Cache-Control: no-cache
# DNT: 1
# Upgrade-Insecure-Requests: 1
# User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36
# Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
# Sec-Fetch-Site: none
# Sec-Fetch-Mode: navigate
# Sec-Fetch-User: ?1
# Sec-Fetch-Dest: document
# Accept-Encoding: gzip, deflate, br
# Accept-Language: en-GB,en-US;q=0.9,en;q=0.8,ar;q=0.7,fr;q=0.6
# Cookie: _octo=GH1.1.419877753.1574418903; tz=Europe%2FLondon; logged_in=yes; dotcom_user=mbana

# curl 'https://api.github.com/orgs/banaio/repos' \
#   -H 'Connection: keep-alive' \
#   -H 'Pragma: no-cache' \
#   -H 'Cache-Control: no-cache' \
#   -H 'DNT: 1' \
#   -H 'Upgrade-Insecure-Requests: 1' \
#   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36' \
#   -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
#   -H 'Sec-Fetch-Site: none' \
#   -H 'Sec-Fetch-Mode: navigate' \
#   -H 'Sec-Fetch-User: ?1' \
#   -H 'Sec-Fetch-Dest: document' \
#   -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8,ar;q=0.7,fr;q=0.6' \
#   -H 'Cookie: _octo=GH1.1.419877753.1574418903; tz=Europe%2FLondon; logged_in=yes; dotcom_user=mbana' \
#   --compressed

# curl \
#   -I \
#   -v \
#   -H "Accept: application/vnd.github.inertia-preview+json" \
#   https://api.github.com/users/banaio/projects

# curl \
#   -I \
#   -v \
#   -H "Accept: application/vnd.github.inertia-preview+json" \
#   https://api.github.com/users/banaio/projects

# # # For zsh
# # setopt -s nullglob   # Non-matching globs are removed  ('*.foo' => '')
# # setopt -s failglob   # Non-matching globs throw errors
# # setopt -s nocaseglob # Case insensitive globs
# # setopt -s globstar   # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')

# echo "" >> projects.md
# wget -O repos.json 'https://api.github.com/orgs/banaio/repos'
# # NB: Remove spaces from beginning and end of description string
# cat repos.json | jq -r \
#   '
# .[] |
# select(.language == "Rust") |
# if (.description != null) then
#   ("* **" + (.description | gsub("(^\\s+)|(\\s+$)";"")) + ":** [" + .html_url + "]" + "(" + .html_url + ")")
# else
#   ("* [" + .html_url + "]" + "(" + .html_url + ")")
# end
# ' >> projects.md
