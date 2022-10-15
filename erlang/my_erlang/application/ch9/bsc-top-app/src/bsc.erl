-module(bsc).
-behaviour(application).

%% Application callbacks
-export([start/2, start_phase/3, stop/1]).

start(_StartType, _StartArgs) ->
    bsc_sup:start_link().

start_phase(StartPhase, StartType, Args) ->
    io:format("bsc:start_phase(~p,~p,~p).~n",
              [StartPhase, StartType, Args]).

stop(_Data) ->
    ok.

% 如果 没有定义函数 start_phase
%    registered_name: []
%    exception exit: {bad_return_value,
%                        {{bsc,start_phase,[init,normal,[]]},
%                         {'EXIT',
%                             {undef,
%                                 [{bsc,start_phase,[init,normal,[]],[]},
%                                  {application_starter,run_the_phase,4,
%                                      [{file,"application_starter.erl"},
%                                       {line,99}]},
%
