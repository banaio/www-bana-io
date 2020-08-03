#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail
set -x

# set -euo pipefail
#set -euxo pipefail

ls -1 .


\usemodule[filter]

\defineexternalfilter
  [markdown]
  [
    filter={ pandoc --from=markdown --to=context --output=\externalfilteroutputfile },
    directory=output/
  ]

\starttext
\startmarkdown
Does **markdown** _work_?
\stopmarkdown
\stoptext
\endinput


# # pandoc -f markdown -t context+ntb -o test.tex test.md

# pandoc --from=markdown --to=context --output=cover-letter_include.tex ../cover-letter.md
# %% how to translate markdown in this doc
# \usemodule[filter]

# \defineexternalfilter
#   [markdown]
#   [
#     filtercommand={pandoc --from=markdown --to=context --output=cover-letter_include.tex ../cover-letter.md},
#     directory=output
#   ]

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
