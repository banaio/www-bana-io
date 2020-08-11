# http://agdr.org/2020/05/14/Polyglot-Makefiles.html
# https://tech.davis-hansson.com/p/make/

# SHELL 		:=	bash
# # SHELL 		:=	/bin/bash
# # SHELL 	:=	/usr/bin/zsh
# # SHELL		:=	/bin/sh
# .ONESHELL:
SHELL 			:= bash
# # SHELL 		:= /bin/bash -o pipefail
# .SHELLFLAGS 	:= -veuf -o pipefail -c
# # .SHELLFLAGS 	:= -euo pipefail -c
# .DEFAULT_GOAL	:= all
# .DELETE_ON_ERROR:
MAKEFLAGS 	+= --warn-undefined-variables
# MAKEFLAGS 	+= --no-builtin-rules
# MAKEFLAGS 	+= --print-directory
# MAKEFLAGS 	+= --jobs=32
# https://www.gnu.org/software/make/manual/html_node/Parallel-Output.html#Parallel-Output
# MAKEFLAGS 	+= --output-sync=target
# # debug
# MAKEFLAGS 	+= --just-print
# MAKEFLAGS 	+= --dry-run
# MAKEFLAGS 	+= --recon

# IFS=$'\n\t'

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

# https://www.arp242.net/dot-git.html
.PHONY: commit
commit:
	@printf "%b" "${GREEN}" "  ---> committing " "${RESET}" "\n"
	git --no-pager log -n1
	@# git commit -m "$(shell cat stratch/commit-msg.md)"
	GIT_EDITOR=vi git commit -eF stratch/commit-msg.md
	git --no-pager log -n1

# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions-enterprise-linux-fedora-and-snap-packages
# https://github.com/nodesource/distributions/blob/master/README.md
# # Using Ubuntu
# curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# sudo apt-get install -y nodejs
.PHONY: node_init
node_init: NODE_VERSION_REQUIRED=$(shell cat ./.node-version | grep -oP '(?<=v)[0-9]+' | tr -d "\n" ; echo -e '.x')
# node_init: NODE_VERSION_REQUIRED=$(shell cat ./.node-version | egrep -o '[0-9]+\.[0-9]+')
node_init:
	@printf "%b" "${GREEN}" "  ---> intalling Node.js " "${RESET}" "\n"
	echo "current - node --version: $(shell node --version), required: ${NODE_VERSION_REQUIRED}"
	@echo
	curl -sL https://deb.nodesource.com/setup_${NODE_VERSION_REQUIRED} | sudo -E bash -
	sudo apt-get install -y nodejs
	@# ## Run `sudo apt-get install -y nodejs` to install Node.js 14.x and npm
	@# ## You may also need development tools to build native addons:
	@#      sudo apt-get install gcc g++ make
	@# ## To install the Yarn package manager, run:
	@#      curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	@#      echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt autoremove
	sudo apt-get install gcc g++ make
	sudo apt-get update
	@# sudo apt-get update && sudo apt-get install yarn
	@echo
	echo "updated - node --version: $(shell node --version)"
	@echo
	sudo apt autoremove
