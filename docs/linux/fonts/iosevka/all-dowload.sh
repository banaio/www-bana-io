#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
# https://stackoverflow.com/questions/37040055/selection-of-multiple-json-keys-using-jq
#
# https://github.com/be5invis/Iosevka
# https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8
#
# $ grep "browser_download_url" downloads.json | cut -d : -f 2,3 | tr -d \" 
#
# $ curl -s https://api.github.com/repos/jgm/pandoc/releases/latest \
# | grep "browser_download_url.*deb" \
# | cut -d : -f 2,3 \
# | tr -d \" \
# | wget -qi -
# $ curl -s https://api.github.com/repos/jgm/pandoc/releases/latest \
# | grep "browser_download_url.*deb" \
# | cut -d '"' -f 4 \
# | wget -qi -
# $ curl -s https://api.github.com/repos/mozilla/geckodriver/releases/latest \
#   | grep browser_download_url \
#   | grep linux64 \
#   | cut -d '"' -f 4 \
#   | wget -qi -
#
# 
set -euf -o pipefail
set -x

wget -q -O downloads.json https://api.github.com/repos/be5invis/Iosevka/releases/latest
FILES=$(jq -r '.assets | .[] | [.browser_download_url] | @tsv' downloads.json)

rm -vr downloads
mkdir downloads
cd downloads

for FILE in ${FILES[@]}
do
    wget ${FILE}
done

# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-aile-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-curly-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-curly-slab-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-etoile-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-slab-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-sparkle-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss01-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss02-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss03-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss04-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss05-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss06-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss07-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss08-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss09-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss10-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss11-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss12-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss13-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/pkg-iosevka-ss14-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-aile-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-curly-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-curly-slab-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-etoile-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-slab-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-sparkle-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss01-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss02-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss03-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss04-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss05-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss06-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss07-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss08-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss09-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss10-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss11-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss12-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss13-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttc-iosevka-ss14-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-aile-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-curly-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-curly-slab-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-etoile-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-curly-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-curly-slab-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-slab-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss01-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss02-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss03-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss04-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss05-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss06-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss07-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss08-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss09-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss10-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss11-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss12-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss13-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-fixed-ss14-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-slab-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-sparkle-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss01-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss02-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss03-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss04-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss05-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss06-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss07-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss08-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss09-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss10-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss11-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss12-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss13-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-ss14-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-curly-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-curly-slab-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-slab-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss01-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss02-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss03-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss04-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss05-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss06-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss07-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss08-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss09-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss10-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss11-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss12-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss13-3.3.1.zip
# https://github.com/be5invis/Iosevka/releases/download/v3.3.1/ttf-iosevka-term-ss14-3.3.1.zip
