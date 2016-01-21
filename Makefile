PROJECT = cowboy_default_static_file
PROJECT_DESCRIPTION = Cowboy middleware to use a default file with cowboy_static
PROJECT_VERSION = 1.0.0

DEPS = bucs cowboy
dep_bucs = git https://github.com/botsunit/bucs.git master
dep_cowboy = git https://github.com/ninenines/cowboy.git master

include erlang.mk
