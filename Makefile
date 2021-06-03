.DEFAULT_GOAL := build

DESTDIR ?=
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

build:

install:
	install -d $(DESTDIR)$(BINDIR)
	install -C tfwrap $(DESTDIR)$(BINDIR)/tfwrap
	ln -sf tfwrap $(DESTDIR)$(BINDIR)/terraform
	install -C tfwrap-terraform-install $(DESTDIR)$(BINDIR)/tfwrap-terraform-install
