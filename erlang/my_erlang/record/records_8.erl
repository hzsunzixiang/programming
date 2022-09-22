-module(records_8).
-compile(export_all).
-compile(nowarn_export_all).

-record(test, {f1, f2, f3, f4, f5,f6}).  

-record(nrec0, {name = "nested0"}).
-record(nrec1, {name = "nested1", nrec0=#nrec0{}}).
-record(nrec2, {name = "nested2", nrec1=#nrec1{}}).

    
% is record = {nrec2,"nested2",{nrec1,"nested1",{nrec0,"nested0"}}}
%
start() ->
   N2 = #nrec2{},
   io:format("is record = ~p~n",[N2]),
   'this is the end'.
