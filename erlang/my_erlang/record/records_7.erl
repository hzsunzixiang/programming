-module(records_7).
-compile(export_all).
-compile(nowarn_export_all).

-record(test, {f1, f2, f3, f4, f5,f6}).  

%If several fields are to be assigned the same value, the following construction can be used:
%
%#Name{Field1=Expr1,...,FieldK=ExprK, _=ExprL}
%
%
start() ->
   Test = #test{f1=1, f2=3, _=88},
   io:format("is record = ~p~n",[Test]),
   'this is the end'.

% is record = {test,1,3,88,88,88,88}
%
% 
%first_robot() ->
%    #robot{name="Mechatron",
%           type=handmade, 
%           details=["Moved by a small man inside"]}.
%
%car_factory(CorpName) ->
%    #robot{name=CorpName, hobbies="building cars"}.
%
%
%is_person(P) when is_record(P, person) ->
%    true;
%is_person(_P) ->
%    false.
%



