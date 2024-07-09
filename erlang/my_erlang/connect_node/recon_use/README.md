recon_use
=====

An OTP application

Build
-----

    $ rebar3 compile


%% 特别注意需要先load，否则无法跟踪到
Eshell V13.0.4  (abort with ^G)
1> ===> Booted recon_use
===> Booted sasl

1> l(arithmetic).
{module,arithmetic}
2> recon_trace:calls({arithmetic, '_', fun(_) -> return_trace() end}, 20, [{scope, local}]).
6
3> arithmetic:multiply(4, 3).
12

10:51:53.818919 <0.161.0> arithmetic:multiply(4, 3)

10:51:53.831352 <0.161.0> arithmetic:'-multiply/2-fun-0-'(1, 0, 4)

10:51:53.831455 <0.161.0> arithmetic:'-multiply/2-fun-0-'/3 --> 4

10:51:53.831596 <0.161.0> arithmetic:'-multiply/2-fun-0-'(2, 4, 4)

10:51:53.831716 <0.161.0> arithmetic:'-multiply/2-fun-0-'/3 --> 8

10:51:53.831834 <0.161.0> arithmetic:'-multiply/2-fun-0-'(3, 8, 4)

10:51:53.831926 <0.161.0> arithmetic:'-multiply/2-fun-0-'/3 --> 12

10:51:53.831991 <0.161.0> arithmetic:multiply/2 --> 12

