%%%-------------------------------------------------------------------
%% @doc hello_server public API
%% @end
%%%-------------------------------------------------------------------

-module(hello_server_app).

-behaviour(application).

-export([start/2, stop/1]).

%start(_StartType, _StartArgs) ->
%    hello_server_sup:start_link().


%start(_StartType, _StartArgs) ->
%    Dispatch = cowboy_router:compile([
%        { Host, [{Path, Handler, InitialState}]}
%    ]),
%    hello_server_sup:start_link().

%start(_StartType, _StartArgs) ->
%    Dispatch = cowboy_router:compile([
%        { <<"localhost">>, [{<<"/">>, hello_handler, [] }]
%    ]),
%    hello_server_sup:start_link().
start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        { <<"localhost">>, [{<<"/">>, hello_handler, []}] }
    ]),
    {ok, _} = cowboy:start_clear(
        ello_listener,
        [{port, 8081}],
        #{env => #{dispatch => Dispatch}}
    ),
    hello_server_sup:start_link().
stop(_State) ->
    ok.

%% internal functions
