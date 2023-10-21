-include_lib("kernel/include/logger.hrl").

-module(metadata).
-compile([export_all]).
-compile(nowarn_export_all).


start() ->

%    logger:notice(#{got => connection_request, id => 100000, state => helllo}),
%=NOTICE REPORT==== 21-Oct-2023::11:42:09.461176 ===
%    id: 100000
%    state: helllo
%    got: connection_request
%

    logger:notice(#{got => connection_request, id => 100000, state => helllo},
    		             #{report_cb => fun(R) -> {"...~p...",[R]} end}),

%=NOTICE REPORT==== 21-Oct-2023::11:39:33.454989 ===
%...#{id => 100000,state => helllo,got => connection_request}...

    'this is an end'.


