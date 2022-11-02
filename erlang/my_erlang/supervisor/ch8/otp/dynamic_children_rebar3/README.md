dynamic_children_rebar3
=====

dynamic children rebar3

Build
-----

    $ rebar3 compile


2> supervisor:which_children(dynamic_children_rebar3_sup).                                                                                           [20/1971]
[{phone_sup,<0.212.0>,worker,[phone_sup]},
 {frequency,<0.211.0>,worker,[frequency]},
 {freq_overload,<0.210.0>,worker,[freq_overload]}]
3> {ok,P1} = phone_sup:attach_phone(1).
{ok,<0.249.0>}
4> {ok,P2} = phone_sup:attach_phone(2).
{ok,<0.252.0>}
5> {ok,P3} = phone_sup:attach_phone(3).
{ok,<0.255.0>}
6> {ok,P4} = phone_sup:attach_phone(4).
{ok,<0.258.0>}
7> {ok,P5} = phone_sup:attach_phone(5).
{ok,<0.262.0>}
8> {ok,P6} = phone_sup:attach_phone(6).
{ok,<0.265.0>}
9> {ok,P7} = phone_sup:attach_phone(7).
{ok,<0.268.0>}
10> {ok,P8} = phone_sup:attach_phone(8).
{ok,<0.271.0>}
11> {ok,P9} = phone_sup:attach_phone(9).
{ok,<0.274.0>}
12> {ok,P10} = phone_sup:attach_phone(10).
{ok,<0.277.0>}
13> {ok,P11} = phone_sup:attach_phone(11).
{ok,<0.280.0>}
14> {ok,P12} = phone_sup:attach_phone(12).
{ok,<0.283.0>}
15> phone_fsm:action({outbound,1}, P2).
*DBG* <0.252.0> got sync_all_state_event {outbound,1} from <0.199.0> in state idle
<0.252.0> dialing 1
*DBG* <0.252.0> sent ok to <0.199.0>
      and switched to state calling
*DBG* <0.249.0> got event {inbound,<0.252.0>} in state idle
*DBG* <0.249.0> switched to state receiving
ok
16> *DBG* <0.249.0> got event {action,reject} in state receiving
*DBG* <0.249.0> switched to state idle
*DBG* <0.252.0> got event {reject,<0.249.0>} in state calling
1 connecting to 2 failed:rejected
<0.252.0> cleared
*DBG* <0.252.0> switched to state idle



17> supervisor:which_children(dynamic_children_rebar3_sup).
[{phone_sup,<0.212.0>,worker,[phone_sup]},
 {frequency,<0.211.0>,worker,[frequency]},
 {freq_overload,<0.210.0>,worker,[freq_overload]}]
18> supervisor:which_children(phone_sup).
[{12,<0.283.0>,worker,[phone_fsm]},
 {11,<0.280.0>,worker,[phone_fsm]},
 {10,<0.277.0>,worker,[phone_fsm]},
 {9,<0.274.0>,worker,[phone_fsm]},
 {8,<0.271.0>,worker,[phone_fsm]},
 {7,<0.268.0>,worker,[phone_fsm]},
 {6,<0.265.0>,worker,[phone_fsm]},
 {5,<0.262.0>,worker,[phone_fsm]},
 {4,<0.258.0>,worker,[phone_fsm]},
 {3,<0.255.0>,worker,[phone_fsm]},
 {2,<0.252.0>,worker,[phone_fsm]},
 {1,<0.249.0>,worker,[phone_fsm]}]

