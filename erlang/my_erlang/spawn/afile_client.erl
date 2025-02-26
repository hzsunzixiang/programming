%% ---
%%  Excerpted from "Programming Erlang, Second Edition",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/jaerlang2 for more book information.
%%---
-module(afile_client).
-export([start/0, ls/1, get_file/2]).

ls(Server) ->
    Server ! {self(), list_dir},
    receive 
	{Server, FileList} ->
	    %FileList
        io:fwrite("~p~n",[FileList])
    end.

get_file(Server, File) ->
    Server ! {self(), {get_file, File}},
    receive 
	{Server, Content} ->
	    %Content
        io:fwrite("~p~n",[Content])
    end.

start() -> 
    FileServer = afile_server:start("."),
    %get_file(FileServer, "missing"),
    get_file(FileServer, "afile_server.erl"),
    ls(FileServer).
    %receive X -> X end.
