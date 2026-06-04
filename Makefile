.DEFAULT_GOAL := help

PYENV_PYTHON := $(shell if command -v pyenv >/dev/null 2>&1 && pyenv versions --bare | grep -qx '3.8.13'; then printf 'PYENV_VERSION=3.8.13 pyenv exec python'; fi)
PYTHON ?= $(if $(PYENV_PYTHON),$(PYENV_PYTHON),python3)
VENV ?= .venv
PORT ?= 8005

VENV_BIN := $(VENV)/bin
VENV_PYTHON := $(CURDIR)/$(VENV_BIN)/python
SPHINXBUILD := $(CURDIR)/$(VENV_BIN)/sphinx-build
BUILD_DIR := docs/_build
INSTALL_STAMP := $(VENV)/.installed
DOC_TARGETS := dirhtml singlehtml pickle json htmlhelp qthelp devhelp epub latex latexpdf latexpdfja text man texinfo info gettext changes linkcheck doctest xml pseudoxml netlify

.PHONY: help install build html serve clean $(DOC_TARGETS)

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  install   create $(VENV) and install dependencies"
	@echo "  html      build standalone HTML files"
	@echo "  serve     build and serve docs at http://localhost:$(PORT)/"
	@echo "  clean     remove generated documentation files"
	@echo
	@echo "Other Sphinx targets are forwarded to docs/Makefile."

install: $(INSTALL_STAMP)

$(INSTALL_STAMP): requirements.txt
	@test -n "$(PYTHON)" || (echo "python3 is required" && exit 1)
	$(PYTHON) -m venv $(VENV)
	$(VENV_PYTHON) -m pip install --upgrade pip
	$(VENV_PYTHON) -m pip install -r requirements.txt
	@touch $(INSTALL_STAMP)

build: html

html: install
	$(MAKE) -C docs html SPHINXBUILD=$(SPHINXBUILD)
	@touch $(BUILD_DIR)/html/.nojekyll

serve: html
	cd $(BUILD_DIR)/html && $(VENV_PYTHON) -m http.server $(PORT)

clean:
	rm -rf $(BUILD_DIR)/*

# These targets let you run common docs/Makefile targets from the repository root.
$(DOC_TARGETS): install
	$(MAKE) -C docs $@ SPHINXBUILD=$(SPHINXBUILD)
