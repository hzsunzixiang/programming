%% ---
-module(io_example).
-compile(export_all).
-compile(nowarn_export_all).


%start() ->
%    {ok, IoDevice} = file:open("test.txt", [write,binary]),
%    io:format(IoDevice, <<"good">>, []),
%    ok = file:close(IoDevice).
start() ->
    'this is an end'.

