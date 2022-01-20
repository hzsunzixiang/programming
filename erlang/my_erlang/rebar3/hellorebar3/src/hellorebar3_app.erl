%%%-------------------------------------------------------------------
%% @doc hellorebar3 public API
%% @end
%%%-------------------------------------------------------------------

-module(hellorebar3_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
%        Dispatch = cowboy_router:compile([
%        		{'_', [ {"/", hello_handler, [] }]}
%		]),
%        {ok, _} = cowboy:start_clear(http_listener,
%        		[{port, 8090}],
%                #{env => #{dispatch => Dispatch}}
%		),
%        hellorebar3_sup:start_link().
    Dispatch = cowboy_router:compile([
			{'_', [{"/", hello_handler, []}]}
	]),
    {ok, _} = cowboy:start_clear(http_listener, 
			[{port, 8099}],
            #{env => #{dispatch => Dispatch}}
			),
    hellorebar3_sup:start_link().
    

		

stop(_State) ->
    ok.

%% internal functions
