#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail
# set -x
# set -euo pipefail
# set -euxo pipefail

pandoc \
  --fail-if-warnings \
  --from=markdown \
  --standalone \
  --pdf-engine=context \
  --include-in-header=templates/include-in-header.tex \
  --include-before-body=./templates/include-before-body.tex \
  --include-after-body=./templates/include-after-body.tex \
  --variable=date:"$(date --utc +'%A, %d %B %Y, %H:%M:%S %Z')" \
  --output=../pdf/mohamed-bana_cv.pdf \
  ../cv.md
echo "----"
pandoc \
  --fail-if-warnings \
  --from=markdown \
  --standalone \
  --pdf-engine=context \
  --include-in-header=templates/include-in-header.tex \
  --include-before-body=./templates/include-before-body.tex \
  --include-after-body=./templates/include-after-body.tex \
  --variable=date:"$(date --utc +'%A, %d %B %Y, %H:%M:%S %Z')" \
  --output=../pdf/mohamed-bana_cover-letter.pdf \
  ../cover-letter.md
echo "----"

cp -v ../pdf/mohamed-bana_cv.pdf ../mohamed-bana_cv.pdf
cp -v ../pdf/mohamed-bana_cover-letter.pdf ../mohamed-bana_cover-letter.pdf

# xdg-open ../pdf/mohamed-bana_cv.pdf
# xdg-open ../pdf/mohamed-bana_cover-letter.pdf

# https://pandoc.org/MANUAL.html#general-options
# $ pandoc -D context --print-default-template context > template.tex

# --trace --verbose \
  # --template=./template.tex \
  # --variable=date:"$(date --iso-8601='s')" \
  # --variable=date:"$(date --utc)" \

# # https://pandoc.org/MANUAL.html#specifying-formats
# # Supported input and output formats are listed below under Options (see -f for input formats and -t for output formats). You can also use pandoc --list-input-formats and pandoc --list-output-formats to print lists of supported formats.
# $ pandoc --list-input-formats
# $ pandoc --list-output-formats
# $ pandoc --list-extensions=context
# $ pandoc --list-extensions=markdown

# # List default ConTeXt otuput format:
# # https://pandoc.org/MANUAL.html#templates
# pandoc -D context

# ## List supported extensions for FORMAT, one per line, preceded by a + or - indicating whether it is enabled by default in FORMAT. If FORMAT is not specified, defaults for pandoc’s Markdown are given.
# $ pandoc --list-extensions=context
# -abbreviations
# -all_symbols_escapable
# -amuse
# -angle_brackets_escapable
# -ascii_identifiers
# +auto_identifiers
# -autolink_bare_uris
# -backtick_code_blocks
# -blank_before_blockquote
# -blank_before_header
# -bracketed_spans
# -citations
# -compact_definition_lists
# -definition_lists
# -east_asian_line_breaks
# -emoji
# -empty_paragraphs
# -epub_html_exts
# -escaped_line_breaks
# -example_lists
# -fancy_lists
# -fenced_code_attributes
# -fenced_code_blocks
# -fenced_divs
# -footnotes
# -four_space_rule
# -gfm_auto_identifiers
# -grid_tables
# -hard_line_breaks
# -header_attributes
# -ignore_line_breaks
# -implicit_figures
# -implicit_header_references
# -inline_code_attributes
# -inline_notes
# -intraword_underscores
# -latex_macros
# -line_blocks
# -link_attributes
# -lists_without_preceding_blankline
# -literate_haskell
# -markdown_attribute
# -markdown_in_html_blocks
# -mmd_header_identifiers
# -mmd_link_attributes
# -mmd_title_block
# -multiline_tables
# -native_divs
# -native_spans
# -ntb
# -old_dashes
# -pandoc_title_block
# -pipe_tables
# -raw_attribute
# -raw_html
# -raw_tex
# -shortcut_reference_links
# -simple_tables
# +smart
# -space_in_atx_header
# -spaced_reference_links
# -startnum
# -strikeout
# -subscript
# -superscript
# -styles
# -table_captions
# -tex_math_dollars
# -tex_math_double_backslash
# -tex_math_single_backslash
# -yaml_metadata_block
# $ pandoc --list-extensions=markdown
# -abbreviations
# +all_symbols_escapable
# -amuse
# -angle_brackets_escapable
# -ascii_identifiers
# +auto_identifiers
# -autolink_bare_uris
# +backtick_code_blocks
# +blank_before_blockquote
# +blank_before_header
# +bracketed_spans
# +citations
# -compact_definition_lists
# +definition_lists
# -east_asian_line_breaks
# -emoji
# -empty_paragraphs
# -epub_html_exts
# +escaped_line_breaks
# +example_lists
# +fancy_lists
# +fenced_code_attributes
# +fenced_code_blocks
# +fenced_divs
# +footnotes
# -four_space_rule
# -gfm_auto_identifiers
# +grid_tables
# -hard_line_breaks
# +header_attributes
# -ignore_line_breaks
# +implicit_figures
# +implicit_header_references
# +inline_code_attributes
# +inline_notes
# +intraword_underscores
# +latex_macros
# +line_blocks
# +link_attributes
# -lists_without_preceding_blankline
# -literate_haskell
# -markdown_attribute
# +markdown_in_html_blocks
# -mmd_header_identifiers
# -mmd_link_attributes
# -mmd_title_block
# +multiline_tables
# +native_divs
# +native_spans
# -ntb
# -old_dashes
# +pandoc_title_block
# +pipe_tables
# +raw_attribute
# +raw_html
# +raw_tex
# +shortcut_reference_links
# +simple_tables
# +smart
# +space_in_atx_header
# -spaced_reference_links
# +startnum
# +strikeout
# +subscript
# +superscript
# -styles
# +table_captions
# +tex_math_dollars
# -tex_math_double_backslash
# -tex_math_single_backslash
# +yaml_metadata_block
