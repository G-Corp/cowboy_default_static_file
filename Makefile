PROJECT = cowboy_default_static_file

DEPS = bucs cowboy
dep_bucs = git https://github.com/botsunit/bucs.git master
dep_cowboy = git https://github.com/ninenines/cowboy.git 2.0.0-pre.3

include erlang.mk
