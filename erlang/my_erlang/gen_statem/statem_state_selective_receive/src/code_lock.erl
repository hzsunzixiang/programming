-module(code_lock).
-define(NAME, code_lock_1).
-export([start_link/1,button/1]).

start_link(Code) ->
    spawn(
      fun () ->
	      true = register(?NAME, self()),
	      do_lock(),
	      locked(Code, length(Code), [])
      end).

button(Button) ->
    ?NAME ! {button,Button}.


locked(Code, Length, Buttons) ->
    receive
        {button,Button} ->
            NewButtons =
                if
                    length(Buttons) < Length ->
                        Buttons;
                    true ->
                        tl(Buttons)
                end ++ [Button],
            if
                NewButtons =:= Code -> % Correct
                    do_unlock(),
		    open(Code, Length);
                true -> % Incomplete | Incorrect
                    locked(Code, Length, NewButtons)
            end
    end.
open(Code, Length) ->
    receive
    after 10000 -> % Time in milliseconds
	    do_lock(),
	    locked(Code, Length, [])
    end.

do_lock() ->
    io:format("Locked~n", []).
do_unlock() ->
    io:format("Open~n", []).
