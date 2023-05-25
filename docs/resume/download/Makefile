# http://agdr.org/2020/05/14/Polyglot-Makefiles.html
# https://tech.davis-hansson.com/p/make/

# .ONESHELL:
SHELL						:= /usr/bin/env bash
# IFS						:= $'\n\t'
.SHELLFLAGS 		:= -o pipefail -o noclobber -o errexit -o pipefail -o nounset -c
# .SHELLFLAGS 		:= -euf -o pipefail -c
.DEFAULT_GOAL		:= all
.DELETE_ON_ERROR:
MAKEFLAGS 			+= --environment-overrides
MAKEFLAGS 			+= --warn-undefined-variables
MAKEFLAGS 			+= --no-builtin-rules
MAKEFLAGS 			+= --no-builtin-variables

BOLD   					:= \033[1m
GREEN  					:= \033[32m
YELLOW 					:= \033[33m
MISC						:= \033[92m
RED							:= \033[91m
RESET  					:= \033[0m
GIT_REV					:= $(shell git rev-parse --short HEAD)

# DATE_TIME="$(date --iso-8601='s')"
DATE_TIME 			:= $(shell date --utc +'%A, %d %B %Y, %H:%M:%S %Z')
# OUTPUT_DIR="./docs/resume/download"
# OUTPUT_DIR="./download"
OUTPUT_DIR 			:= $(shell pwd)
OS 							:= $(shell uname -s)

.PHONY: clean combine-pdfs
all: clean combine-pdfs

.PHONY: clean
clean:
	-rm -v missfont.log
	-rm -v \
		mohamed-bana_cv.pdf \
		mohamed-bana_cover-letter.pdf \
		mohamed-bana_cv_cover-letter.pdf \
		mohamed-bana_cv.docx \
		mohamed-bana_cover-letter.docx \
		mohamed-bana_cv.odt \
		mohamed-bana_cover-letter.odt \
		mohamed-bana_cv.text \
		mohamed-bana_cover-letter.text

.PHONY: tex-cv
tex-cv:
	@printf "%b" "${GREEN}" "---> ${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${RESET}" "\n"
	pandoc \
    --fail-if-warnings \
    --from=markdown \
    --standalone \
    --pdf-engine=xelatex \
    --output="${OUTPUT_DIR}/mohamed-bana_cv.tex" \
    ../cv.md

.PHONY: tex-cover-letter
tex-cover-letter:
	@printf "%b" "${GREEN}" "---> ${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${RESET}" "\n"
	pandoc \
    --fail-if-warnings \
    --from=markdown \
    --standalone \
    --pdf-engine=xelatex \
    --output="${OUTPUT_DIR}/mohamed-bana_cover-letter.tex" \
    ../cover-letter.md

.PHONY: all-cv
all-cv: tex-cv
	@printf "%b" "${GREEN}" "---> ${OUTPUT_DIR}/mohamed-bana_cv.*" "${RESET}" "\n"
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
    --to=plain \
    --from=markdown \
    --standalone \
    --variable=date:"${DATE_TIME}" \
    --output="${OUTPUT_DIR}/mohamed-bana_cv.text" \
    ../cv.md

.PHONY: all-cover-letter
all-cover-letter: tex-cover-letter
	pandoc \
    --fail-if-warnings \
    --from=markdown \
    --standalone \
    --include-in-header=./templates/include-in-header.tex \
    --include-before-body=./templates/include-before-body.tex \
    --include-after-body=./templates/include-after-body.tex \
    --variable=date:"${DATE_TIME}" \
    --output="${OUTPUT_DIR}/mohamed-bana_cover-letter.odt" \
    ../cover-letter.md
	pandoc \
    --fail-if-warnings \
    --from=markdown \
    --standalone \
    --include-in-header=./templates/include-in-header.tex \
    --include-before-body=./templates/include-before-body.tex \
    --include-after-body=./templates/include-after-body.tex \
    --variable=date:"${DATE_TIME}" \
    --output="${OUTPUT_DIR}/mohamed-bana_cover-letter.docx" \
    ../cover-letter.md
	pandoc \
    --fail-if-warnings \
    --to=plain \
    --from=markdown \
    --standalone \
    --variable=date:"${DATE_TIME}" \
    --output="${OUTPUT_DIR}/mohamed-bana_cover-letter.text" \
    ../cover-letter.md

.PHONY: combine-pdfs
combine-pdfs: all-cv all-cover-letter
	# @#/bin/sh -c 'make all-cv && make all-cover-letter && make combine-pdfs & wait'
	# $(MAKE) all-cv
	# $(MAKE) all-cover-letter
ifeq ($(OS),Darwin)
	pdfunite "${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
	open "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
else
	pdfunite "${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
	xdg-open "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
endif
	-cat missfont.log
