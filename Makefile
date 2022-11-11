# Basic Makefile for python project

VERSION	?= $(shell cat $(PWD)/.version 2> /dev/null || echo v0)

# Python commands
PYCMD = python
PIP = pip3
PYTEST = pytest

.PHONY: help deps tools test all release

default: help

# show this help
help:
	@echo 'usage: make [target] ...'
	@echo ''
	@echo 'targets:'
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: ## test
	make test

deps: ## install deps
	$(PIP) install --user -r requirements.txt

env: ## Env
	@echo $(VERSION)
  @echo $(PYCMD) --version
  @echo $(PYCMD) -m pip --version
	@echo "--------"
	$(PYCMD) -m pip list

# tools
tools: ## tools
	$(PYCMD) -m pip freeze > requirements.txt

test:	## tests
	$(PYTEST)

run: ## run
	$(PYCMD) hello.py

release:
	git tag $(VERSION)
	git push --tags
