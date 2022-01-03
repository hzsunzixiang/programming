-module(records_3).
-compile(export_all).
-compile(nowarn_export_all).

-record(user, {id, name, group, age}).

%% use pattern matching to filter
admin_panel(#user{name=Name, group=admin}) ->
    Name ++ " is allowed!";
admin_panel(#user{name=Name}) ->
    Name ++ " is not allowed".

%% can extend user without problem
adult_section(U = #user{}) when U#user.age >= 18 ->
    %% Show stuff that can't be written in such a text
    allowed;
adult_section(_) ->
    %% redirect to sesame street site
    forbidden.



start() ->
    X1 = admin_panel(#user{id=1, name="ferd", group=admin, age=96}),
    io:format("the firsh data= ~p~n",[X1]),
    X2 = admin_panel(#user{id=2, name="you", group=admin, age=66}),
    io:format("the firsh data= ~p~n",[X2]),
    X3= adult_section(#user{id=3, name="Bill", group=admin, age=72}),
    io:format("the firsh data= ~p~n",[X3]),
    X4= adult_section(#user{id=4, name="Noah", group=admin, age=13}),
    io:format("the firsh data= ~p~n",[X4]),
    admin_panel(#user{id=5, name="Hello", group=admin, age=96}).
