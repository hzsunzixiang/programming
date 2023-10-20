
% 返回值 跟这一句是联动的: logger:set_primary_config(filter_default, stop),
%ok = logger:add_primary_filter(
%      discarded_messages, {fun filter_discarded_message/2, ignore}).
%1. 如果 filter_default 设置为log, filter_discarded_message/2 返回ignore 则打印
%2. 如果 filter_default 设置为stop, filter_discarded_message/2 返回ignore 则忽略

%filter_discarded_message(_LogEvent, _OnMatch) ->
%    ignore.
%

erl -noshell -kernel logger_sasl_compatible true -s handler_filter_log_event start -s init stop
in filter_discarded_message  LogEvent:#{meta =>
                                         #{error_logger =>
                                            #{tag => info_report,
                                              type => std_info},
                                           pid => <0.9.0>,
                                           time => 1697768620736084,
                                           gl => <0.70.0>,
                                           report_cb =>
                                            #Fun<error_logger.0.17945318>},
                                        msg =>
                                         {report,
                                          #{label =>
                                             {error_logger,info_report},
                                            report =>
                                             "Something strange happened"}},
                                        level => notice}


in filter_discarded_message  LogEvent:#{meta =>
                                         #{error_logger => #{tag => error},
                                           pid => <0.9.0>,
                                           time => 1697768878700781,
                                           gl => <0.70.0>,
                                           report_cb =>
                                            #Fun<error_logger.0.17945318>},
                                        msg =>
                                         {report,
                                          #{args => [],
                                            label => {error_logger,error_msg},
                                            format =>
                                             "Something strange happened"}},
                                        level => error}

in filter_discarded_message  LogEvent:#{meta =>
                                         #{error_logger => #{tag => error},
                                           pid => <0.9.0>,
                                           time => 1697769103584295,
                                           gl => <0.70.0>,
                                           report_cb =>
                                            #Fun<error_logger.0.17945318>},
                                        msg =>
                                         {report,
                                          #{args =>
                                             "Something strange happened",
                                            label => {error_logger,error_msg},
                                            format => "~s~n"}},
                                        level => error}

