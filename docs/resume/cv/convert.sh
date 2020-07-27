#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail
set -x

# set -euo pipefail
#set -euxo pipefail

ls -1 .

pandoc \
  --fail-if-warnings \
  --trace --verbose \
  --from=markdown \
  --standalone \
  --pdf-engine=context \
  --output=cv_converted.pdf \
  ../cv.md

xdg-open cv_converted.pdf


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
