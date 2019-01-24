SHELL:=/bin/bash
PWD:=$(shell pwd)
SOURCE_CODE:=$(shell pwd)
LOCAL_DIRECTORY_PATH:=$(shell echo $$(pwd)/workspace)

all: validate run

.PHONY: validate
validate:
	@for BUILD_CONFIG in `find $(PWD) -type f -name 'cloudbuild*.yaml'`; do \
		echo -e "\033[92m" "Building $$BUILD_CONFIG ..." "\033[0m"; \
		cloud-build-local --config=$$BUILD_CONFIG --dryrun=true $(SOURCE_CODE); \
		if [[ $$? == 0 ]]; then \
			echo -e "\033[92m" "VALID $$BUILD_CONFIG ..." "\033[0m"; \
		else \
			echo -e "\033[91m" "INVALID $$BUILD_CONFIG ..." "\033[0m"; \
			exit 1; \
		fi; \
	done

.PHONY: run
run:
	@for BUILD_CONFIG in `find $(PWD) -type f -name 'cloudbuild*.yaml'`; do \
		echo -e "\033[92m" "Building $$BUILD_CONFIG ..." "\033[0m"; \
		cloud-build-local --config=$$BUILD_CONFIG --dryrun=false --write-workspace=$(LOCAL_DIRECTORY_PATH) $(SOURCE_CODE); \
		if [[ $$? == 0 ]]; then \
			echo -e "\033[92m" "VALID $$BUILD_CONFIG ..." "\033[0m"; \
		else \
			echo -e "\033[91m" "INVALID $$BUILD_CONFIG ..." "\033[0m"; \
			exit 1; \
		fi; \
	done
