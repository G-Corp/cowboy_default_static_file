PROJECT = cowboy_default_static_file

DEP_PLUGINS = mix.mk
BUILD_DEPS = mix.mk
ELIXIR_VERSION = ~> 1.2
dep_mix.mk = git https://github.com/botsunit/mix.mk.git master

DEPS = bucs cowboy
dep_bucs = git https://github.com/botsunit/bucs.git 0.0.1
dep_cowboy = git https://github.com/ninenines/cowboy.git 2.0.0-pre.3

include erlang.mk

release: app mix.exs

