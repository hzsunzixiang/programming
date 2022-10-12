Eshell V13.0.4  (abort with ^G)
1> bsc_sup:start_link().
{ok,<0.83.0>}
2> phone:start_test(150,500).

3> my_counters:get_counters(freq_overload).
{counters,[{{event,{frequency_denied,<0.86.0>}},21},
           {{set_alarm,{no_frequency,<0.86.0>}},4},
           {{clear_alarm,no_frequency},4}]}

