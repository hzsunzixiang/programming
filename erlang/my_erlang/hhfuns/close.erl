-module(close).
-compile(nowarn_export_all).
-compile(export_all).


% https://learnyousomeerlang.com/higher-order-functions#anonymous-functions

base(A) ->
    B = A + 1,
    F = fun() -> A * B end.

%% bases/1. Refered as the same function refactored in the book
base1(A) ->
    B = A + 1,
    F = fun() -> A * B end,
    F().

%%% can't compile this one
%% base(A) ->
%%    B = A + 1,
%%    F = fun() -> C = A * B end,
%%    F(),
%%    C.

base2() ->
    A = 1,
    (fun() -> A = 2 end)().

base3() ->
    A = 1,
    (fun(A) -> A = 2 end)(2).

a() ->
    Secret = "pony",
    fun() -> Secret end.

b(F) ->
    "a/0's password is "++F().

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].


start() ->
    PrepareAlarm = fun(Room) ->
    	io:format("Alarm set in ~s.~n",[Room]),
    	fun() -> io:format("Alarm tripped in ~s! Call Batman!~n",[Room]) end
    	end,
    AlarmReady = PrepareAlarm("bathroom"),
    io:format("Hello, World!~p~n", [AlarmReady()]),
    F=base(5),
    io:format("Hello, World!~p~n", [F()]),
    io:format("Hello, World!~p~n", [(base(5))()]),  %% 必须加括号，结合性
    io:format("Hello, World!~p~n", [b(a())]),
    Base = 2,
    PowerOfTwo = fun(X) -> math:pow(Base,X) end,
    io:format("Hello, World!~p~n", [map(PowerOfTwo, [1,2,3,4])]),
    io:format("Hello, World!~p~n", [base1(5)]).


    %#Fun<erl_eval.20.67289768>
    %12> AlarmReady = PrepareAlarm("bathroom").
    %Alarm set in bathroom.
    %#Fun<erl_eval.6.13229925>
    %13> AlarmReady().
    %Alarm tripped in bathroom! Call Batman!
    %ok

