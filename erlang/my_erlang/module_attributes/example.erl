-module(example).
-author("John Doe").
%% Custom attribute
-module_description("This is an example module.").

-export([hello/0]).

hello() ->
    io:format("Hello, world!~n").


