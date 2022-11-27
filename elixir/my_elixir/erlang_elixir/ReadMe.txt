
ericksun@centos7-dev:~/programming/elixir/my_elixir/erlang_elixir (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> code:add_patha("/home/ericksun/program/elixir/bin/../lib/elixir/ebin").
true
2> 'Elixir.IO':puts(123).
123
ok
3> halt().

ericksun@centos7-dev:~/programming/elixir/my_elixir/erlang_elixir (master)$ ERL_LIBS=/home/ericksun/program/elixir/bin/../lib/ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> 'Elixir.IO':puts(123).
123
ok
2>
User switch command
 --> s 'Elixir.IEx'
 -->  c 2
Interactive Elixir (1.15.0-dev) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> IO.puts(123)
123
:ok
iex(2)>
User switch command
 --> c 1

2> 'Elixir.IO':puts(123).
123
ok
3> j
3>
User switch command
 --> j
   1* {shell,start,[init]}
   2  {'Elixir.IEx',start,[]}
 --> ?
  c [nn]            - connect to job
  i [nn]            - interrupt job
  k [nn]            - kill job
  j                 - list all jobs
  s [shell]         - start local shell
  r [node [shell]]  - start remote shell
  q                 - quit erlang
  ? | h             - this message
 --> q

