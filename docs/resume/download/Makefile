# http://agdr.org/2020/05/14/Polyglot-Makefiles.html
# https://tech.davis-hansson.com/p/make/

# .ONESHELL:
SHELL							:= /usr/bin/env bash
# IFS							:= $'\n\t'
.SHELLFLAGS 			:= -o pipefail -o noclobber -o errexit -o pipefail -o nounset -c
# .SHELLFLAGS 			:= -euf -o pipefail -c
.DEFAULT_GOAL			:= all
.DELETE_ON_ERROR:
MAKEFLAGS 				+= --environment-overrides
MAKEFLAGS 				+= --warn-undefined-variables
MAKEFLAGS 				+= --no-builtin-rules
MAKEFLAGS 				+= --no-builtin-variables

BOLD   						:= \033[1m
GREEN  						:= \033[32m
YELLOW 						:= \033[33m
MISC							:= \033[92m
RED								:= \033[91m
RESET  						:= \033[0m

GIT_REV						:= $(shell git rev-parse --short HEAD)

# DATE_TIME="$(date --iso-8601='s')"
DATE_TIME 				:= $(shell date --utc +'%A, %d %B %Y, %H:%M:%S %Z')
# OUTPUT_DIR="./docs/resume/download"
# OUTPUT_DIR="./download"
OUTPUT_DIR 				:= $(shell pwd)
OS 								:= $(shell uname -s)

.PHONY: clean cv_tex cover_letter_tex combine
all: clean cv_tex cover_letter_tex combine

.PHONY: clean
clean:
	rm -v missfont.log || true
	rm -v mohamed-bana_cover-letter.pdf  mohamed-bana_cv_cover-letter.pdf  mohamed-bana_cv.pdf || true

.PHONY: cv_tex
cv_tex:
	@printf "%b" "${GREEN}" "  ---> ${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${RESET}" "\n"
	pandoc \
    --fail-if-warnings \
    --from=markdown \
    --standalone \
    --pdf-engine=xelatex \
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
	pandoc \
    --fail-if-warnings \
    --from=markdown \
    --standalone \
    --pdf-engine=xelatex \
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
    --pdf-engine=xelatex \
    --include-in-header=./templates/include-in-header.tex \
    --variable=date:"${DATE_TIME}" \
    --output="${OUTPUT_DIR}/mohamed-bana_cover-letter.odt" \
    ../cover-letter.md
	pandoc \
    --fail-if-warnings \
    --from=markdown \
    --standalone \
    --pdf-engine=xelatex \
    --include-in-header=./templates/include-in-header.tex \
    --variable=date:"${DATE_TIME}" \
    --output="${OUTPUT_DIR}/mohamed-bana_cover-letter.docx" \
    ../cover-letter.md
	pandoc \
    --fail-if-warnings \
    --from=markdown \
    --to=opendocument \
    --standalone \
    --pdf-engine=xelatex \
    --include-in-header=./templates/include-in-header.tex \
    --variable=date:"${DATE_TIME}" \
    --output="${OUTPUT_DIR}/mohamed-bana_cover-letter.xml" \
    ../cover-letter.md

.PHONY: combine
combine: cv_tex cover_letter_tex
	@printf "%b" "${GREEN}" "  ---> combining " "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf" "${RESET}" "\n"
ifeq ($(OS),Darwin)
	pdfunite "${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
	open "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
else
	pdfunite "${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
	xdg-open "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf"
endif
	cat missfont.log || true

# .PHONY: copy_to_send_dir
# copy_to_send_dir: SEND_DIR=${OUTPUT_DIR}/send
# copy_to_send_dir:
# 	@printf "%b" "${GREEN}" "  ---> copying " "SEND_DIR=${SEND_DIR}" "${RESET}" "\n"
# 	@mkdir -p "${OUTPUT_DIR}/send"
# 	@cp -v "${OUTPUT_DIR}/mohamed-bana_cv.pdf" "${SEND_DIR}"
# 	@#cp -v "${OUTPUT_DIR}/mohamed-bana_cv.docx" "${SEND_DIR}"
# 	@#cp -v "${OUTPUT_DIR}/mohamed-bana_cv.odt" "${SEND_DIR}"
# 	@echo
# 	@cp -v "${OUTPUT_DIR}/mohamed-bana_cover-letter.pdf" "${SEND_DIR}"
# 	@#cp -v "${OUTPUT_DIR}/mohamed-bana_cover-letter.docx" "${SEND_DIR}"
# 	@#cp -v "${OUTPUT_DIR}/mohamed-bana_cover-letter.odt" "${SEND_DIR}"
# 	@echo
# 	@cp -v "${OUTPUT_DIR}/mohamed-bana_cv_cover-letter.pdf" "${SEND_DIR}"
# 	@ls -1 "${SEND_DIR}"
