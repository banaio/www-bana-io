SHELL:=/bin/bash
PWD:=$(shell pwd)
SOURCE_CODE:=$(shell pwd)
LOCAL_DIRECTORY_PATH:=$(shell echo $$(pwd)/workspace)
BUILD_CONFIGS:=$(shell find $(PWD) -maxdepth 1 -type f -name 'cloudbuild*.yaml')

all: validate

.PHONY: validate
validate:
	@for BUILD_CONFIG in $(BUILD_CONFIGS); do \
		echo -e "\033[92m" "Validating $$BUILD_CONFIG ..." "\033[0m"; \
		set -x; \
		cloud-build-local --config=$$BUILD_CONFIG --dryrun=true $(SOURCE_CODE); \
		set +x; \
		if [[ $$? == 0 ]]; then \
			echo -e "\033[92m" "VALID $$BUILD_CONFIG ..." "\033[0m"; \
		else \
			echo -e "\033[91m" "INVALID $$BUILD_CONFIG ..." "\033[0m"; \
			exit 1; \
		fi; \
	done


.PHONY: run
run:
	@for BUILD_CONFIG in $(BUILD_CONFIGS); do \
		echo -e "\033[92m" "Running $$BUILD_CONFIG ..." "\033[0m"; \
		set -x; \
		cloud-build-local --config=$$BUILD_CONFIG --dryrun=false --write-workspace=$(LOCAL_DIRECTORY_PATH) $(SOURCE_CODE); \
		set +x; \
		if [[ $$? == 0 ]]; then \
			echo -e "\033[92m" "VALID $$BUILD_CONFIG ..." "\033[0m"; \
		else \
			echo -e "\033[91m" "INVALID $$BUILD_CONFIG ..." "\033[0m"; \
			exit 1; \
		fi; \
	done
