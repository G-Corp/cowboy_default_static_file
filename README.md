# cowboy_default_static_file

This allows you to specify a default file when using cowboy_static with
dir or priv_dir. Thus the path will be completed with the default file.

Example :

```
Dispatch = cowboy_router:compile(
             [
              {'_', 
               [
                {"/[...]", cowboy_static, {priv_dir, my_app, "", [{mimetypes, cow_mimetypes, all}, 
                                                                  {default_file, "index.html"}]}}
               ]}
             ]),
```

You also need to add  cowboy_default_static_file` in the cowboy middelware list :

> Add this middelware *after* cowboy_router and *before* cowboy_handler !

```
_ = cowboy:start_http(http, 100, [{port, 8080}], [
      {env, [{dispatch, Dispatch}]},
      {middlewares, [cowboy_router, cowboy_default_static_file, cowboy_handler]}
    ])
```

Thus http://localhost:8080/howdy/ will do the same as http://localhost:8080/howdy/index.html

