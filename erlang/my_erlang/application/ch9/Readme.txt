erl -config bsc.config -sasl slsa_error_logger false -pa bsc-1.0/ebin
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> application:which_applications().
[{stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
3> application:ensure_all_started(bsc).
{ok,[sasl,bsc]}
4> observer:start().
ok
