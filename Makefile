SHELL 	:=	/bin/bash
# SHELL 	:=	/usr/bin/zsh
# SHELL	:=	/bin/sh
# set -euf -o pipefail # https://sipb.mit.edu/doc/safe-shell/
GIT_REV	:=	$(shell git rev-parse --short HEAD)

.PHONY: dev
all: dev

.PHONY: clean
clean:
	@printf "%b" "\033[92m" "  ---> cleaning directories" "\033[0m" "\n"
	rm --verbose --recursive --force --dir docs/.temp || true
	rm --verbose --recursive --force --dir docs/.cache || true
	rm --verbose --recursive --force --dir docs/.vuepress/dist || true
	@# --force: ignore nonexistent files and arguments, never prompt
	@# find ./docs/.vuepress/public -mindepth 1 -maxdepth 1 -type d \! \( -iname cv -o -iname fonts -o -iname static \)
	rm --verbose --recursive --force --dir $(shell find ./docs/.vuepress/public -mindepth 1 -maxdepth 1 -type d \! \( -iname cv -o -iname fonts -o -iname static \))
	@#rmdir --parents

.PHONY: dev
dev: clean
	@printf "%b" "\033[92m" "  ---> starting dev server" "\033[0m" "\n"
	@# npx vuepress dev docs --cache docs/.cache --temp docs/.temp --no-clear-screen --no-cache --debug
	yarn docs:dev

.PHONY: build_prod
build_prod:
	@printf "%b" "\033[92m" "  ---> building production" "\033[0m" "\n"
	yarn docs:build

.PHONY: test_prod
test_prod: build_prod
	@printf "%b" "\033[92m" "  ---> test production build" "\033[0m" "\n"
	yarn docs:build
	caddy run --config ./server/Caddyfile --adapter caddyfile

.PHONY: lint
lint:
	@printf "%b" "\033[92m" "  ---> linting" "\033[0m" "\n"
	yarn lint-md

.PHONY: init
init:
	@printf "%b" "\033[92m" "  ---> initialising " "\033[0m" "\n"
	yarn install --frozen-lockfile --non-interactive
