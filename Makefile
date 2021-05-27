.DEFAULT_GOAL := build

DESTDIR ?=
PREFIX ?= /usr/local

build:

install:
	install -d $(DESTDIR)$(PREFIX)/bin
	install -C tfwrap $(DESTDIR)$(PREFIX)/bin/tfwrap
	ln -sf tfwrap $(DESTDIR)$(PREFIX)/bin/terraform
	install -C tfwrap-terraform-install $(DESTDIR)$(PREFIX)/bin/tfwrap-terraform-install
