


HandlerFun =
fun({trace, Pid, gc_start,Start}, _) ->
    Start;
({trace, Pid, gc_end, End}, Start) ->
    {_, {_,OHS}} = lists:keysearch(old_heap_size, 1, Start),
    {_, {_,OHE}} = lists:keysearch(old_heap_size, 1, End), 
    io:format("Old heap size delta after gc:~w~n",[OHS-OHE]),
    {_, {_,HS}} = lists:keysearch(heap_size, 1,Start),
    {_, {_,HE}} = lists:keysearch(heap_size, 1, End), 
    io:format("Heap size delta after gc:~w~n", [HS-HE])
end.


dbg:tracer(process, {HandlerFun, null}).




Eshell V13.0.4  (abort with ^G)
	1> HandlerFun =
	1> fun({trace, Pid, gc_start,Start}, _) ->
	1>     Start;
	1> ({trace, Pid, gc_end, End}, Start) ->
	1>     {_, {_,OHS}} = lists:keysearch(old_heap_size, 1, Start),
	1>     {_, {_,OHE}} = lists:keysearch(old_heap_size, 1, End),
	1>     io:format("Old heap size delta after gc:~w~n",[OHS-OHE]),
	1>     {_, {_,HS}} = lists:keysearch(heap_size, 1,Start),
	1>     {_, {_,HE}} = lists:keysearch(heap_size, 1, End),
	1>     io:format("Heap size delta after gc:~w~n", [HS-HE])
	1> end.
#Fun<erl_eval.41.3316493>
2> dbg:tracer(process, {HandlerFun,null}).
{ok,<0.84.0>}

7> List1 = lists:seq(1,1000).
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,
 23,24,25,26,27,28,29|...]
8> List1 = lists:seq(1,1000).
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,
 23,24,25,26,27,28,29|...]
9>
9> Revlist  = lists:reverse(List1).
[1000,999,998,997,996,995,994,993,992,991,990,989,988,987,
 986,985,984,983,982,981,980,979,978,977,976,975,974,973,972|...]

