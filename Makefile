# http://agdr.org/2020/05/14/Polyglot-Makefiles.html
# https://tech.davis-hansson.com/p/make/

# SHELL 		:=	bash
# # SHELL 		:=	/bin/bash
# # SHELL 	:=	/usr/bin/zsh
# # SHELL		:=	/bin/sh
.ONESHELL:
SHELL 			:= bash
# SHELL 		:= /bin/bash -o pipefail
.SHELLFLAGS 	:= -euf -o pipefail -c
# .SHELLFLAGS 	:= -euo pipefail -c
.DEFAULT_GOAL	:= all
.DELETE_ON_ERROR:
MAKEFLAGS 	+= --warn-undefined-variables
MAKEFLAGS 	+= --no-builtin-rules

BOLD   	:= \033[1m
GREEN  	:= \033[32m
YELLOW 	:= \033[33m
MISC	:= \033[92m
RESET  	:= \033[0m

GIT_REV	:=	$(shell git rev-parse --short HEAD)

.PHONY: dev
all: dev

.PHONY: clean
clean:
	@printf "%b" "${GREEN}" "  ---> cleaning directories" "${RESET}" "\n"
	rm --verbose --recursive --force --dir docs/.temp
	rm --verbose --recursive --force --dir docs/.cache
	rm --verbose --recursive --force --dir docs/.vuepress/dist
	@# --force: ignore nonexistent files and arguments, never prompt
	@# find ./docs/.vuepress/public -mindepth 1 -maxdepth 1 -type d \! \( -iname cv -o -iname fonts -o -iname static \)
	rm --verbose --recursive --force --dir $(shell find ./docs/.vuepress/public -mindepth 1 -maxdepth 1 -type d \! \( -iname cv -o -iname fonts -o -iname static \))
	@#rmdir --parents

.PHONY: dev
dev: clean
	@printf "%b" "${GREEN}" "  ---> starting dev server" "${RESET}" "\n"
	@# npx vuepress dev docs --cache docs/.cache --temp docs/.temp --no-clear-screen --no-cache --debug
	yarn docs:dev

.PHONY: build_prod
build_prod:
	@printf "%b" "${GREEN}" "  ---> building production" "${RESET}" "\n"
	yarn docs:build

.PHONY: test_prod
test_prod: build_prod
	@printf "%b" "${GREEN}" "  ---> test production build" "${RESET}" "\n"
	yarn docs:build
	caddy run --config ./server/Caddyfile --adapter caddyfile

.PHONY: lint
lint:
	@printf "%b" "${GREEN}" "  ---> linting" "${RESET}" "\n"
	yarn lint-md

.PHONY: init
init:
	@printf "%b" "${GREEN}" "  ---> initialising " "${RESET}" "\n"
	yarn install --frozen-lockfile --non-interactive

.PHONY: commit
commit:
	@printf "%b" "${GREEN}" "  ---> committing " "${RESET}" "\n"
	git commit -m "$(shell cat stratch/commit-msg.md)"
	git log -n1
