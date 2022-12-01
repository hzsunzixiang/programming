Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
	1> persistent_term:put(test_term, {test, 1, self(), make_ref()}).
	ok
	2> persistent_term:get(test_term).
{test,1,<0.81.0>,#Ref<0.2806183601.2511601666.233118>}
3> persistent_term:put(test_term, {test1, 1, self(), make_ref()}).
ok
4> persistent_term:get(test_term).
{test1,1,<0.81.0>,#Ref<0.2806183601.2511601666.233138>}

5> persistent_term:info().
#{count => 20,memory => 34400}
6> persistent_term:put(test_term1, {test1, 1, self(), make_ref()}).
ok
7> persistent_term:info().
#{count => 21,memory => 34504}
8> persistent_term:erase(test_term1).
true
9> persistent_term:info().
#{count => 20,memory => 34400}
10>

