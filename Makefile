.PHONY: doc
include bu.mk

compile:
	$(verbose) $(REBAR) compile

elixir:
	$(verbose) $(REBAR) elixir generate_mix
	$(verbose) $(REBAR) elixir generate_lib

dist: compile elixir

distclean:
	$(verbose) rm -rf _build rebar.lock mix.lock deps

