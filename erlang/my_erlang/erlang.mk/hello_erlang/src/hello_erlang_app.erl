-module(hello_erlang_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

%start(_Type, _Args) ->
%	hello_erlang_sup:start_link().


start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/", hello_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(my_http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
    hello_erlang_sup:start_link().
stop(_State) ->
	ok.
