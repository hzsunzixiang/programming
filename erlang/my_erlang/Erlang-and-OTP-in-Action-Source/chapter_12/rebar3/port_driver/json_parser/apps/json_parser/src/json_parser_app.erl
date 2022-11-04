%%%-------------------------------------------------------------------
%% @doc json_parser public API
%% @end
%%%-------------------------------------------------------------------

-module(json_parser_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _StartArgs) ->
    %{ok, LDPath} = application:get_env(ld_path),
	%os:putenv("LD_LIBRARY_PATH", LDPath),
	%os:putenv("LD_LIBRARY_PATH", "$LD_LIBRARY_PATH:/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/yajl_install/lib/"),
	%                            "/home/ericksun/programming/erlang/my_erlang/Erlang-and-OTP-in-Action-Source/chapter_12/yajl_install/lib/"
    case json_parser_sup:start_link() of
      {ok, Pid} ->
          {ok, Pid};
      Other ->
          {error, Other}
    end.

stop(_State) ->
    ok.

%% internal functions
