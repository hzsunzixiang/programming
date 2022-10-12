
ericksun@centos7-dev:~/programming/erlang/my_erlang/gen_supervisor/ch8/otp/simple_phone_sup (master)$ erl
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
1> frequency_sup:start_link().
{ok,<0.83.0>}
2> simple_phone_sup:start_link().
{ok,<0.88.0>}
3> simple_phone_sup:attach_phone(1).
{ok,<0.90.0>}
4> simple_phone_sup:attach_phone(2).
{ok,<0.92.0>}
5> supervisor:which_children(frequency_sup).
[{frequency,<0.85.0>,worker,[frequency]},
 {freq_overload,<0.84.0>,worker,[freq_overload]}]
6> supervisor:which_children(simple_phone_sup).
[{undefined,<0.90.0>,worker,[phone_fsm]},
 {undefined,<0.92.0>,worker,[phone_fsm]}]

