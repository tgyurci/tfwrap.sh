.DEFAULT_GOAL := build

PREFIX ?= /usr/local

build:

install:
	install -C tfwrap $(PREFIX)/bin/tfwrap
	ln -sf tfwrap $(PREFIX)/bin/terraform
