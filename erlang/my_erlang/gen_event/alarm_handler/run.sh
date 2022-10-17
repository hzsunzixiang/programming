1> alarm_handler:set_alarm({100, tooHot}).
2> alarm_handler:get_alarms().
3> gen_event:swap_handler(alarm_handler, {alarm_handler, swap}, {my_alarm_handler, 0}).
4> alarm_handler:get_alarms().
5> alarm_handler:set_alarm({100,tooHot}).
6> alarm_handler:clear_alarm(100).
7> rb:start([{max, 20}]).
8> rb:list().
9> rb:show(1).    %%  第一个消息也就是最后一个消息，是清除告警 error_logger:error_msg("*** Danger over. Turn off the fan~n"),
