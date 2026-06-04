.DEFAULT_GOAL := help

UV ?= uv
PYTHON_VERSION ?= 3.12
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
	@echo "  install   create $(VENV) with uv and install dependencies"
	@echo "  html      build standalone HTML files"
	@echo "  serve     build and serve docs at http://localhost:$(PORT)/"
	@echo "  clean     remove generated documentation files"
	@echo
	@echo "Other Sphinx targets are forwarded to docs/Makefile."

install: $(INSTALL_STAMP)

$(INSTALL_STAMP): pyproject.toml uv.lock Makefile
	@command -v $(UV) >/dev/null 2>&1 || (echo "uv is required. Install it from https://docs.astral.sh/uv/" && exit 1)
	$(UV) sync --python $(PYTHON_VERSION) --frozen --no-install-project
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
