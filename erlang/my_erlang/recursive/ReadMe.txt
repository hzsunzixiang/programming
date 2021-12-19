

# 计时器的使用方式
  # https://puredanger.github.io/tech.puredanger.com/2008/12/30/playing-with-erlang/
  The tc function takes the module, function, and list of arguments and returns a tuple with the time (in microseconds) and the result.
       io:format("Hello, World!~p~n", [timer:tc(fib, fib, [40])]).
