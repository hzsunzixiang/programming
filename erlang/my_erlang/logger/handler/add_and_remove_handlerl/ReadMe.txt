


5:31:07.147408 <0.129.0> logger_h_common:try_format(#{meta=>#{line=>496, pid=><0.129.0>, time=>1697448666947550, file=>"src/prelaunch_logging.erl", gl=><0.126.0>, domain=>[rabbitmq,prelaunch], mfa=>{prelaunch_logging,install_handlers,0}}, msg=>{string,"Logging: configured log handlers are now ACTIVE"}, level=>notice}, rabbit_logger_text_fmt, #{single_line=>false, use_colors=>false})

5:31:07.147640 <0.129.0> rabbit_logger_text_fmt:format(#{meta=>#{line=>496, pid=><0.129.0>, time=>1697448666947550, file=>"src/prelaunch_logging.erl", gl=><0.126.0>, domain=>[rabbitmq,prelaunch], mfa=>{prelaunch_logging,install_handlers,0}}, msg=>{string,"Logging: configured log handlers are now ACTIVE"}, level=>notice}, #{single_line=>false, use_colors=>false})





try_format(Log,Formatter,FormatterConfig) ->
    try Formatter:format(Log,FormatterConfig)
    catch
        C:R:S ->
            ?LOG_INTERNAL(debug,Log,[{formatter_crashed,Formatter},
                                     {config,FormatterConfig},
                                     {log_event,Log},
                                     {reason,
                                      {C,R,logger:filter_stacktrace(?MODULE,S)}}]),
            case {?DEFAULT_FORMATTER,#{}} of
                {Formatter,FormatterConfig} ->
                    "DEFAULT FORMATTER CRASHED\n";
                {DefaultFormatter,DefaultConfig} ->
                    try_format(Log#{msg=>{"FORMATTER CRASH: ~tp",
                                          [maps:get(msg,Log)]}},
                              DefaultFormatter,DefaultConfig)
            end
    end.


erl -noshell -s add_handler start -s init stop
2023-10-21 11:16:16.501799-04:00 [info] <0.71.0> Supervisor {local,logger_sup}: child rmq_1_file_1 started (<0.86.0>): {logger_olp,start_link,[rabbit_logger_std_h_rmq_1_file_1,logger_h_common,#{id => rmq_1_file_1,module => rabbit_logger_std_h,config => #{type => file,file => "/home/ericksun/programming/erlang/my_erlang/logger/handler/add_handler/log/mq1.log",compress_on_rotate => false,file_check => 0,max_no_bytes => infinity,max_no_files => 0,modes => [delayed_write,raw,append],filesync_repeat_interval => 5000,rotate_on_date => false},level => debug,filter_default => log,filters => [{progress_reports,{fun logger_filters:progress/2,log}},{rmqlog_filter,{#Fun<add_handler.0.6352107>,#{global => all,prelaunch => notice}}}],formatter => {rabbit_logger_text_fmt,#{single_line => false,use_colors => false}}},#{burst_limit_enable => false}]}
HandlerConfig:
#{primary =>
      #{level => all,filter_default => log,filters => [],metadata => #{}},
  proxy =>
      #{burst_limit_enable => false,drop_mode_qlen => 1000,flush_qlen => 5000,
        sync_mode_qlen => 500,overload_kill_restart_after => 5000,
        burst_limit_max_count => 500,burst_limit_window_time => 1000,
        overload_kill_enable => false,overload_kill_mem_size => 3000000,
        overload_kill_qlen => 20000},
  handlers =>
      [#{id => rmq_1_file_1,module => rabbit_logger_std_h,
         config =>
             #{type => file,
               file =>
                   "/home/ericksun/programming/erlang/my_erlang/logger/handler/add_handler/log/mq1.log",
               burst_limit_enable => false,drop_mode_qlen => 200,
               flush_qlen => 1000,sync_mode_qlen => 10,
               overload_kill_restart_after => 5000,
               burst_limit_max_count => 500,burst_limit_window_time => 1000,
               overload_kill_enable => false,
               overload_kill_mem_size => 3000000,overload_kill_qlen => 20000,
               compress_on_rotate => false,file_check => 0,
               max_no_bytes => infinity,max_no_files => 0,
               modes => [delayed_write,raw,append],
               filesync_repeat_interval => 5000,rotate_on_date => false},
         level => debug,filter_default => log,
         filters =>
             [{progress_reports,{fun logger_filters:progress/2,log}},
              {rmqlog_filter,{#Fun<add_handler.0.6352107>,
                              #{global => all,prelaunch => notice}}}],
         formatter =>
             {rabbit_logger_text_fmt,#{single_line => false,
                                       use_colors => false}}},
       #{id => default,module => logger_std_h,
         config =>
             #{type => standard_io,burst_limit_enable => true,
               drop_mode_qlen => 200,flush_qlen => 1000,sync_mode_qlen => 10,
               overload_kill_restart_after => 5000,
               burst_limit_max_count => 500,burst_limit_window_time => 1000,
               overload_kill_enable => false,
               overload_kill_mem_size => 3000000,overload_kill_qlen => 20000,
               filesync_repeat_interval => no_repeat},
         level => all,filter_default => log,
         filters =>
             [{rmqlog_filter,{#Fun<add_handler.0.6352107>,
                              #{global => all,prelaunch => notice}}},
              {remote_gl,{fun logger_filters:remote_gl/2,stop}},
              {domain,{fun logger_filters:domain/2,{log,super,[otp,sasl]}}},
              {no_domain,{fun logger_filters:domain/2,{log,undefined,[]}}}],
         formatter =>
             {rabbit_logger_text_fmt,#{single_line => false,
                                       use_colors => false}}}],
  module_levels => []}
