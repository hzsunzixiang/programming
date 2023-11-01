application:ensure_all_started(simple_cache).
simple_cache:insert(abc,def).
simple_cache:insert(ab,de).
simple_cache:insert(a,d).

%Function = fun(Elem) -> simple_cache:insert(Elem,Elem) end.
%L = [a,b,c,d,e,f,g].
%lists:foreach(Function, L).
%L1 = lists:seq(70,10,-5).
%lists:foreach(Function, L1).

simple_cache:lookup(abc).

