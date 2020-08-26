# http://agdr.org/2020/05/14/Polyglot-Makefiles.html
# https://tech.davis-hansson.com/p/make/

# .ONESHELL:
SHELL					:= bash
# IFS					:= $'\n\t'
.SHELLFLAGS 			:= -o pipefail -o noclobber -o errexit -o pipefail -o nounset -c
# .SHELLFLAGS 			:= -euf -o pipefail -c
.DEFAULT_GOAL			:= all
.DELETE_ON_ERROR:
MAKEFLAGS 				+= --environment-overrides
MAKEFLAGS 				+= --warn-undefined-variables
MAKEFLAGS 				+= --no-builtin-rules
MAKEFLAGS 				+= --no-builtin-variables

BOLD   					:= \033[1m
GREEN  					:= \033[32m
YELLOW 					:= \033[33m
MISC					:= \033[92m
RED						:= \033[91m
RESET  					:= \033[0m

GIT_REV					:= $(shell git rev-parse --short HEAD)

# DATE_TIME="$(date --iso-8601='s')"
DATE_TIME := $(shell date --utc +'%A, %d %B %Y, %H:%M:%S %Z')
# OUTPUT_DIR="./docs/resume/download"
# OUTPUT_DIR="./download"
OUTPUT_DIR := $(shell pwd)

.PHONY: cv_all cover_letter_all combine copy_to_send_dir
all: cv_all cover_letter_all combine copy_to_send_dir

# .PHONY: cv cover_letter combine
# all: cv cover_letter combine

.PHONY: format
format_tex:
	@printf "%b" "${GREEN}" "  ---> latexindent ./templates/*.tex" "${RESET}" "\n"
	ls -lah ./templates_test/*.tex
	latexindent \
		--overwrite \
		--trace \
		--local=./localSettings.yaml \
		./formatted/include-in-header_compact.tex

.PHONY: cv_tex
cv_tex:
	@printf "%b" "${GREEN}" "  ---> ${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${RESET}" "\n"
	@# --variable=date:"${DATE_TIME}" \
	pandoc \
		--fail-if-warnings \
		--from=markdown \
		--standalone \
		--pdf-engine=context \
		--include-in-header=./templates/include-in-header.tex \
		--include-before-body=./templates/include-before-body.tex \
		--include-after-body=./templates/include-after-body.tex \
		--output="${OUTPUT_DIR}/mohamed-bana_cv.pdf" \
		../cv.md

.PHONY: cv_all
cv_all: cv_tex
	@printf "%b" "${GREEN}" "  ---> ${OUTPUT_DIR}/mohamed-bana_cv.*" "${RESET}" "\n"
	pandoc \
		--fail-if-warnings \
		--from=markdown \
		--standalone \
		--include-in-header=./templates/include-in-header.tex \
		--include-before-body=./templates/include-before-body.tex \
		--include-after-body=./templates/include-after-body.tex \
		--variable=date:"${DATE_TIME}" \
		--output="${OUTPUT_DIR}/mohamed-bana_cv.odt" \
		../cv.md
	pandoc \
		--fail-if-warnings \
		--from=markdown \
		--standalone \
		--include-in-header=./templates/include-in-header.tex \
		--include-before-body=./templates/include-before-body.tex \
		--include-after-body=./templates/include-after-body.tex \
		--variable=date:"${DATE_TIME}" \
		--output="${OUTPUT_DIR}/mohamed-bana_cv.docx" \
		../cv.md
	pandoc \
		--fail-if-warnings \
		--to=opendocument \
		--from=markdown \
		--standalone \
		--include-in-header=./templates/include-in-header.tex \
		--include-before-body=./templates/include-before-body.tex \
		--include-after-body=./templates/include-after-body.tex \
		--variable=date:"${DATE_TIME}" \
		--output="${OUTPUT_DIR}/mohamed-bana_cv.xml" \
		../cv.md

.PHONY: cover_letter_tex
cover_letter_tex:
	@printf "%b" "${GREEN}" "  ---> ${OUTPUT_DIR}/mohamed-bana_cover-letter.tex" "${RESET}" "\n"
	@# --include-before-body=./templates/include-before-body.tex
	@# --include-after-body=./templates/include-after-body.tex
	@# --variable=date:"${DATE_TIME}" \
	pandoc \
		--fail-if-warnings \
		--from=markdown \
		--standalone \
		--pdf-engine=context \
		--include-in-header=./templates/include-in-header.tex \
		--output="${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" \
		../cover-letter.md

.PHONY: cover_letter_plain_text
cover_letter_plain_text:
	@printf "%b" "${GREEN}" "  ---> ${OUTPUT_DIR}/mohamed-bana_cover-letter.tex" "${RESET}" "\n"
	@# --include-before-body=./templates/include-before-body.tex
	@# --include-after-body=./templates/include-after-body.tex
	@# --variable=date:"${DATE_TIME}" \
	pandoc \
		--fail-if-warnings \
		--from=markdown \
		--to=plain \
		--standalone \
		--wrap=preserve \
		--output="${OUTPUT_DIR}/mohamed-bana_cover-letter.txt" \
		../cover-letter.md

.PHONY: cover_letter_all
cover_letter_all: cover_letter_tex
	@printf "%b" "${GREEN}" "  ---> ${OUTPUT_DIR}/mohamed-bana_cover-letter.*" "${RESET}" "\n"
	pandoc \
		--fail-if-warnings \
		--from=markdown \
		--standalone \
		--pdf-engine=context \
		--include-in-header=./templates/include-in-header.tex \
		--variable=date:"${DATE_TIME}" \
		--output="${OUTPUT_DIR}/mohamed-bana_cover-letter.odt" \
		../cover-letter.md
	pandoc \
		--fail-if-warnings \
		--from=markdown \
		--standalone \
		--pdf-engine=context \
		--include-in-header=./templates/include-in-header.tex \
		--variable=date:"${DATE_TIME}" \
		--output="${OUTPUT_DIR}/mohamed-bana_cover-letter.docx" \
		../cover-letter.md
	pandoc \
		--fail-if-warnings \
		--from=markdown \
		--to=opendocument \
		--standalone \
		--pdf-engine=context \
		--include-in-header=./templates/include-in-header.tex \
		--variable=date:"${DATE_TIME}" \
		--output="${OUTPUT_DIR}/mohamed-bana_cover-letter.xml" \
		../cover-letter.md

XDG_OPEN_EXISTS := $(shell command -v xdg-open 2> /dev/null)

.PHONY: combine
combine: cv_tex cover_letter_tex
	@printf "%b" "${GREEN}" "  ---> combining " "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf" "${RESET}" "\n"
ifdef XDG_OPEN_EXISTS
	pdfunite "${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
	xdg-open "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
else
	$(error 'canot find pdfunite and xdg-open')
endif

.PHONY: copy_to_send_dir
copy_to_send_dir: SEND_DIR=${OUTPUT_DIR}/send
copy_to_send_dir:
	@printf "%b" "${GREEN}" "  ---> copying " "SEND_DIR=${SEND_DIR}" "${RESET}" "\n"
	@mkdir -p "${OUTPUT_DIR}/send"
	@cp -v "${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${SEND_DIR}"
	@cp -v "${OUTPUT_DIR}/mohamed-bana_cv.docx" "${SEND_DIR}"
	@cp -v "${OUTPUT_DIR}/mohamed-bana_cv.odt" "${SEND_DIR}"
	@echo
	@cp -v "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${SEND_DIR}"
	@cp -v "${OUTPUT_DIR}/mohamed-bana_cover-letter.docx" "${SEND_DIR}"
	@cp -v "${OUTPUT_DIR}/mohamed-bana_cover-letter.odt" "${SEND_DIR}"
	@echo
	@cp -v "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf" "${SEND_DIR}"
	@ls -1 "${SEND_DIR}"




# #!/usr/bin/env bash
# # https://sipb.mit.edu/doc/safe-shell/
# set -euf -o pipefail
# # set -x
# # set -euo pipefail
# # set -euxo pipefail

# # DATE_TIME="$(date --iso-8601='s')"
# # DATE_TIME="$(date --utc)"
# DATE_TIME="$(date --utc +'%A, %d %B %Y, %H:%M:%S %Z')"
# # OUTPUT_DIR="./docs/resume/download"
# # OUTPUT_DIR="./download"
# OUTPUT_DIR="$(pwd)"

# pandoc \
#   --fail-if-warnings \
#   --from=markdown \
#   --standalone \
#   --pdf-engine=context \
#   --include-in-header=./templates/include-in-header.tex \
#   --include-before-body=./templates/include-before-body.tex \
#   --include-after-body=./templates/include-after-body.tex \
#   --variable=date:"${DATE_TIME}" \
#   --output="${OUTPUT_DIR}/mohamed-bana_cv.pdf" \
#   ../cv.md
# echo "----"
#   # --include-before-body=./templates/include-before-body.tex \
#   # --include-after-body=./templates/include-after-body.tex \
# pandoc \
#   --fail-if-warnings \
#   --from=markdown \
#   --standalone \
#   --pdf-engine=context \
#   --include-in-header=./templates/include-in-header.tex \
#   --variable=date:"${DATE_TIME}" \
#   --output="${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" \
#   ../cover-letter.md
# echo "----"

# pdfunite "${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"

# xdg-open "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
# # xdg-open "${OUTPUT_DIR}/mohamed-bana_cv.pdf" || open "${OUTPUT_DIR}/mohamed-bana_cv.pdf"
# # xdg-open "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" || open "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf"


# # https://pandoc.org/MANUAL.html#general-options
# # $ pandoc -D context --print-default-template context > default-template-context.tex

# # # https://pandoc.org/MANUAL.html#specifying-formats
# # # Supported input and output formats are listed below under Options (see -f for input formats and -t for output formats). You can also use pandoc --list-input-formats and pandoc --list-output-formats to print lists of supported formats.
# # $ pandoc --list-input-formats
# # $ pandoc --list-output-formats
# # $ pandoc --list-extensions=context
# # $ pandoc --list-extensions=markdown

# # # List default ConTeXt otuput format:
# # # https://pandoc.org/MANUAL.html#templates
# # pandoc -D context

# # ## List supported extensions for FORMAT, one per line, preceded by a + or - indicating whether it is enabled by default in FORMAT. If FORMAT is not specified, defaults for pandoc’s Markdown are given.
# # $ pandoc --list-extensions=context
# # -abbreviations
# # -all_symbols_escapable
# # -amuse
# # -angle_brackets_escapable
# # -ascii_identifiers
# # +auto_identifiers
# # -autolink_bare_uris
# # -backtick_code_blocks
# # -blank_before_blockquote
# # -blank_before_header
# # -bracketed_spans
# # -citations
# # -compact_definition_lists
# # -definition_lists
# # -east_asian_line_breaks
# # -emoji
# # -empty_paragraphs
# # -epub_html_exts
# # -escaped_line_breaks
# # -example_lists
# # -fancy_lists
# # -fenced_code_attributes
# # -fenced_code_blocks
# # -fenced_divs
# # -footnotes
# # -four_space_rule
# # -gfm_auto_identifiers
# # -grid_tables
# # -hard_line_breaks
# # -header_attributes
# # -ignore_line_breaks
# # -implicit_figures
# # -implicit_header_references
# # -inline_code_attributes
# # -inline_notes
# # -intraword_underscores
# # -latex_macros
# # -line_blocks
# # -link_attributes
# # -lists_without_preceding_blankline
# # -literate_haskell
# # -markdown_attribute
# # -markdown_in_html_blocks
# # -mmd_header_identifiers
# # -mmd_link_attributes
# # -mmd_title_block
# # -multiline_tables
# # -native_divs
# # -native_spans
# # -ntb
# # -old_dashes
# # -pandoc_title_block
# # -pipe_tables
# # -raw_attribute
# # -raw_html
# # -raw_tex
# # -shortcut_reference_links
# # -simple_tables
# # +smart
# # -space_in_atx_header
# # -spaced_reference_links
# # -startnum
# # -strikeout
# # -subscript
# # -superscript
# # -styles
# # -table_captions
# # -tex_math_dollars
# # -tex_math_double_backslash
# # -tex_math_single_backslash
# # -yaml_metadata_block
# # $ pandoc --list-extensions=markdown
# # -abbreviations
# # +all_symbols_escapable
# # -amuse
# # -angle_brackets_escapable
# # -ascii_identifiers
# # +auto_identifiers
# # -autolink_bare_uris
# # +backtick_code_blocks
# # +blank_before_blockquote
# # +blank_before_header
# # +bracketed_spans
# # +citations
# # -compact_definition_lists
# # +definition_lists
# # -east_asian_line_breaks
# # -emoji
# # -empty_paragraphs
# # -epub_html_exts
# # +escaped_line_breaks
# # +example_lists
# # +fancy_lists
# # +fenced_code_attributes
# # +fenced_code_blocks
# # +fenced_divs
# # +footnotes
# # -four_space_rule
# # -gfm_auto_identifiers
# # +grid_tables
# # -hard_line_breaks
# # +header_attributes
# # -ignore_line_breaks
# # +implicit_figures
# # +implicit_header_references
# # +inline_code_attributes
# # +inline_notes
# # +intraword_underscores
# # +latex_macros
# # +line_blocks
# # +link_attributes
# # -lists_without_preceding_blankline
# # -literate_haskell
# # -markdown_attribute
# # +markdown_in_html_blocks
# # -mmd_header_identifiers
# # -mmd_link_attributes
# # -mmd_title_block
# # +multiline_tables
# # +native_divs
# # +native_spans
# # -ntb





















# OUT_DIR=output
# IN_DIR=markdown
# STYLES_DIR=styles
# STYLE=chmduquesne

# all: html pdf docx rtf

# pdf: init
# 	for f in $(IN_DIR)/*.md; do \
# 		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
# 		echo $$FILE_NAME.pdf; \
# 		pandoc --standalone --template $(STYLES_DIR)/$(STYLE).tex \
# 			--from markdown --to context \
# 			--variable papersize=A4 \
# 			--output $(OUT_DIR)/$$FILE_NAME.tex $$f > /dev/null; \
# 		mtxrun --path=$(OUT_DIR) --result=$$FILE_NAME.pdf --script context $$FILE_NAME.tex > $(OUT_DIR)/context_$$FILE_NAME.log 2>&1; \
# 	done

# html: init
# 	for f in $(IN_DIR)/*.md; do \
# 		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
# 		echo $$FILE_NAME.html; \
# 		pandoc --standalone --include-in-header $(STYLES_DIR)/$(STYLE).css \
# 			--lua-filter=pdc-links-target-blank.lua \
# 			--from markdown --to html \
# 			--output $(OUT_DIR)/$$FILE_NAME.html $$f \
# 			--metadata pagetitle=$$FILE_NAME;\
# 	done

# docx: init
# 	for f in $(IN_DIR)/*.md; do \
# 		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
# 		echo $$FILE_NAME.docx; \
# 		pandoc --standalone $$SMART $$f --output $(OUT_DIR)/$$FILE_NAME.docx; \
# 	done

# rtf: init
# 	for f in $(IN_DIR)/*.md; do \
# 		FILE_NAME=`basename $$f | sed 's/.md//g'`; \
# 		echo $$FILE_NAME.rtf; \
# 		pandoc --standalone $$SMART $$f --output $(OUT_DIR)/$$FILE_NAME.rtf; \
# 	done

# init: dir version

# dir:
# 	mkdir -p $(OUT_DIR)

# version:
# 	PANDOC_VERSION=`pandoc --version | head -1 | cut -d' ' -f2 | cut -d'.' -f1`; \
# 	if [ "$$PANDOC_VERSION" -eq "2" ]; then \
# 		SMART=-smart; \
# 	else \
# 		SMART=--smart; \
# 	fi \

# clean:
# 	rm -f $(OUT_DIR)/*
