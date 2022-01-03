%% ---
-module(binary_to_term).
-compile(export_all).
-compile(nowarn_export_all).



start() ->
    X=term_to_binary(7),
	io:format("term_to_binary :~p~n",[X]),
    X1=binary_to_term(X),
	io:format("term_to_binary :~p~n",[X1]).
