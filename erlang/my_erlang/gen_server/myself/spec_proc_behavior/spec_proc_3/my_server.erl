-module(my_server).
%-export([start_link/1]).
%-export([init/1]).
%-export([system_continue/3, system_terminate/4,
%         write_debug/3,
%         system_get_state/1, system_replace_state/2]).
-compile(export_all).
-compile(nowarn_export_all).

start_link(Module) ->
    %register(?MODULE, self()),
    proc_lib:start_link(?MODULE, init, [self(), Module]).

init(Parent, Module) ->
    register(Module, self()),
    Chs = Module:init(),
    Deb = sys:debug_options([]),
    proc_lib:init_ack(Parent, {ok, self()}),  % The new process must also acknowledge that it has been started to the parent:
	% proc_lib:start_link is synchronous and does not return until proc_lib:init_ack has been called.
	% 在这里成功就可以返回了
    loop(Module, Chs, Parent, Deb).

loop(Module, Chs, Parent, Deb) ->
    receive
        {From, alloc} ->
            Deb2 = sys:handle_debug(Deb, fun Module:write_debug/3,
                                    Module, {in, alloc, From}),
            {Ch, Chs2} = Module:alloc(Chs),
            From ! {Module, Ch},
            Deb3 = sys:handle_debug(Deb2, fun Module:write_debug/3,
                                    Module, {out, {Module, Ch}, From}),
            loop(Module, Chs2, Parent, Deb3);
        {free, Ch} ->
            Deb2 = sys:handle_debug(Deb, fun Module:write_debug/3,
                                    Module, {in, {free, Ch}}),
            Chs2 = Module:free(Ch, Chs),
            loop(Module, Chs2, Parent, Deb2);

        {system, From, Request} ->
            sys:handle_system_msg(Request, From, Parent,
                                  Module, Deb, {Chs, Module})
    end.


system_continue(Parent, Deb, {Chs,Module}) ->
    loop(Module, Chs, Parent, Deb).

system_terminate(Reason, _Parent, _Deb, _Chs) ->
    exit(Reason).

system_get_state(Chs) ->
    {ok, Chs}.

system_replace_state(StateFun, Chs) ->
    NChs = StateFun(Chs),
    {ok, NChs, NChs}.
