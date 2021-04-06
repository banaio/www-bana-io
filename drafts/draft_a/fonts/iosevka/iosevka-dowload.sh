#!/usr/bin/env bash
set -euf -o pipefail
set -x

wget -q -O iosevka-downloads.json https://api.github.com/repos/be5invis/Iosevka/releases/latest
FILES=$(jq -r '.assets | .[] | [.browser_download_url] | @tsv' iosevka-downloads.json)

rm -vr iosevka-downloads
mkdir iosevka-downloads
cd iosevka-downloads

for FILE in ${FILES[@]}; do
    wget ${FILE}
done
