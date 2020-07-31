#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail
set -x

# set -euo pipefail
#set -euxo pipefail

ls -1 .

# --trace --verbose \
pandoc \
  --fail-if-warnings \
  --from=markdown \
  --standalone \
  --pdf-engine=context \
  --output=../cover-letter.pdf \
  ../cover-letter.md
xdg-open cover-letter.pdf

# pandoc in.md --pdf-engine=context \
#   -V 'mainfont:DejaVuSerif' \
#   -V 'sansfont:DejaVuSans' \
#   -V 'monofont:DejaVuSansMono' \
#   -V 'mathfont:TeXGyreDejaVuMath' \
#   -o out.odf

# # context --nonstopmode cv.tex && open cv.pdf
# context --extra=markdown ../cover-letter.md
# context cover-letter.tex

# xdg-open cover-letter.pdf

# pandoc \
#   --from=markdown_github \
#   --to=context \
#   --standalone \
#   --preserve-tabs \
#   --trace --verbose --fail-if-warnings \
#   ../cv.md \
#   --output=cv_converted.tex
# # --pdf-engine=xelatex --toc

# ls -1 .

# echo
# echo

# context cv_converted.tex
# xdg-open cv_converted.pdf
