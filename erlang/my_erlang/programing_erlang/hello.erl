% This is a test Hello World Erlang Code
-module(hello).
-import(io,[fwrite/1]).
-export([start/0]).

start() ->
   fwrite("Hello, Erlang World!\n").
