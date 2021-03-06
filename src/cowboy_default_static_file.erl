-module(cowboy_default_static_file).
-behaviour(cowboy_middleware).

-export([execute/2]).

execute(Req, Env) ->
  PathInfo = case {maps:get(handler, Env, undefined),
                   maps:get(handler_opts, Env, undefined)} of
               {cowboy_static, Opts}->
                 path(Req, Opts);
               _ ->
                 Req
             end,
  {ok, Req#{path_info => PathInfo}, Env}.

path(Req, {priv_dir, App, Path, Opts}) ->
  build_path(Req, priv_path(App, Path), Opts);
path(Req, {dir, Path, Opts}) ->
  build_path(Req, Path, Opts).

build_path(Req, Path, Opts) ->
  Dir = fullpath(filename:absname(Path)),
  PathInfo = case cowboy_req:path_info(Req) of
               undefined -> [<<"/">>];
               P -> P
             end,
  Filepath = filename:join([Dir|PathInfo]),
  case filelib:is_dir(Filepath) of
    true ->
      Default = case lists:keyfind(default_file, 1, Opts) of
                  {default_file, D} -> bucs:to_binary(D);
                  _ -> <<"index.html">>
                end,
      PathInfo ++ [Default];
    false ->
      PathInfo
  end.

priv_path(App, Path) ->
  case code:priv_dir(App) of
    {error, bad_name} ->
      error({badarg, "Can't resolve the priv_dir of application " ++ atom_to_list(App)});
    PrivDir when is_list(Path) ->
      PrivDir ++ "/" ++ Path;
    PrivDir when is_binary(Path) ->
      << (list_to_binary(PrivDir))/binary, $/, Path/binary >>
  end.

fullpath(Path) ->
  fullpath(filename:split(Path), []).
fullpath([], Acc) ->
  filename:join(lists:reverse(Acc));
fullpath([<<".">>|Tail], Acc) ->
  fullpath(Tail, Acc);
fullpath([<<"..">>|Tail], Acc=[_]) ->
  fullpath(Tail, Acc);
fullpath([<<"..">>|Tail], [_|Acc]) ->
  fullpath(Tail, Acc);
fullpath([Segment|Tail], Acc) ->
  fullpath(Tail, [Segment|Acc]).

