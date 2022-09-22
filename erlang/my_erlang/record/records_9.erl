-module(records_9).
-compile(export_all).
-compile(nowarn_export_all).

-record(robot, {name::atom(), type=industrial::string(), hobbies::atom(), details=[]::list()}).  
-record(person, { name::atom(), age::number(), status = single::string() }).  

first_robot() ->
    #robot{name="Mechatron",
           type=handmade, 
           details=["Moved by a small man inside"]}.

car_factory(CorpName) ->
    #robot{name=CorpName, hobbies="building cars"}.


is_person(P) when is_record(P, person) ->
    true;
is_person(_P) ->
    false.

start() ->
   X = car_factory("JokesWagen"),
   P = #person{name="hello"},
   NestedBot= #robot{details=#robot{name="erNest"}},
   io:format("is record = ~p~n",[is_record(X, robot)]),
   io:format("is record = ~p~n",[is_record(NestedBot, robot)]),
   io:format("is record = ~p~n",[is_record(NestedBot, person)]),
   io:format("is record = ~p~n",[is_person(X)]),
   io:format("is record = ~p~n",[is_person(P)]),
   'this is the end'.
 
% https://www.erlang.org/doc/reference_manual/typespec.html
%7.4  Type Information in Record Declarations
%The types of record fields can be specified in the declaration of the record. The syntax for this is as follows:
%
%  -record(rec, {field1 :: Type1, field2, field3 :: Type3}).
%For fields without type annotations, their type defaults to any(). That is, the previous example is a shorthand for the following:
%
%  -record(rec, {field1 :: Type1, field2 :: any(), field3 :: Type3}).
%In the presence of initial values for fields, the type must be declared after the initialization, as follows:
%
%  -record(rec, {field1 = [] :: Type1, field2, field3 = 42 :: Type3}).
%The initial values for fields are to be compatible with (that is, a member of) the corresponding types. This is checked by the compiler and results in a compilation error if a violation is detected.
%
