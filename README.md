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

## Licence

cowboy_default_static_file is available for use under the following license, commonly known as the 3-clause (or "modified") BSD license:

Copyright (c) 2016 BotsUnit<br />

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* The name of the author may not be used to endorse or promote products derived from this software without specific prior written permission.



THIS SOFTWARE IS PROVIDED BY THE AUTHOR `AS IS` AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
