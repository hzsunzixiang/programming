
https://stackoverflow.com/questions/20125277/what-is-begin-end-in-erlang-used-for
https://stackoverflow.com/questions/1063497/hidden-features-of-erlang/5141263#5141263

If you want to execute more than one expression in a list comprehension, you can use a block. For example:

[begin erlang:display(N), N*10 end || N <- lists:seq(1,3)].
[begin io:format("shell 1 ~p~n", [erlang:universaltime()]), timer:sleep(1000) end || _ <- lists:seq(1, 1000)].

