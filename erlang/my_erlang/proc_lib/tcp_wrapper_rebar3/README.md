tcp_wrapper_rebar3
=====

tcp_wrap behavior

Build
-----

    $ rebar3 compile




2> Listener <0.185.0>:init_request
Receiving Data
*&
hello world++++++

Listener <0.186.0>:init_request
Receiving Data
*&
hello world++++++

Listener <0.187.0>:init_request
Receiving Data
*&
hello world++++++


2> sys:log(tcp_print, get).
{ok,[<0.182.0>,<0.183.0>,<0.184.0>,<0.185.0>,<0.186.0>,
     <0.187.0>]}
3> sys:log(tcp_print, print).
Listener <0.182.0>:init_request
Listener <0.183.0>:init_request
Listener <0.184.0>:init_request
Listener <0.185.0>:init_request
Listener <0.186.0>:init_request
Listener <0.187.0>:init_request

