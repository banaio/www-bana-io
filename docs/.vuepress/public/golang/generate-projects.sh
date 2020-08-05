#!/usr/bin/env zsh
set -euf -o pipefail

# # For zsh
# setopt -s nullglob   # Non-matching globs are removed  ('*.foo' => '')
# setopt -s failglob   # Non-matching globs throw errors
# setopt -s nocaseglob # Case insensitive globs
# setopt -s globstar   # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')

wget -O repos.json 'https://api.github.com/orgs/banaio/repos'
cat repos.json | jq -r '.[] | select(.language == "Go") | ("* **" + .description + ":** [" + .html_url + "]" + "(" + .html_url + ")")'
# * **Go (golang) FIX Client for the Coinbase GDAX API https://www.gdax.com:** [https://github.com/banaio/go_gdax_fix](https://github.com/banaio/go_gdax_fix)
# * **Go (golang) Client for the Coinbase GDAX API https://www.gdax.com:** [https://github.com/banaio/go-gdax](https://github.com/banaio/go-gdax)
# * **Connect to ForgeRock's directory.:** [https://github.com/banaio/openbankingforgerock](https://github.com/banaio/openbankingforgerock)
# * **:** [https://github.com/banaio/go_samples](https://github.com/banaio/go_samples)
# * **High performance, minimalist Go web framework:** [https://github.com/banaio/echo](https://github.com/banaio/echo)
# * ** Bingo is a Go language server that speaks Language Server Protocol.:** [https://github.com/banaio/bingo](https://github.com/banaio/bingo)
# * **In computer science, the count-distinct problem (also known in applied mathematics as the cardinality estimation problem) is the problem of finding the number of distinct elements in a data stream with repeated elements. This is a well-known problem with numerous applications. The elements might represent IP addresses of packets passing through a router, unique visitors to a web site, elements in a large database, motifs in a DNA sequence, or elements of RFID/sensor networks.:** [https://github.com/banaio/countdistinct](https://github.com/banaio/countdistinct)
# * **Open Banking tools written in Go (golang).:** [https://github.com/banaio/openbanking_tools](https://github.com/banaio/openbanking_tools)
