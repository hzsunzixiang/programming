


% Makefile  
执行make
然后会生成一个ernie目录
进去之后 解压，然后执行start.sh，可以启动程序，如果不行，可以手工启动


# 在foo节点上启动
ericksun@centos7-dev:~/programming/erlang/my_erlang/release/example-package-inet (master)$ erl -name foo@127.0.0.1 -setcookie cookie
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

Eshell V13.0.4  (abort with ^G)
(foo@127.0.0.1)7> erl_boot_server:start([{127,0,0,1}]).
{ok,<0.95.0>}
(foo@127.0.0.1)8> application:which_applications().
[{stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]

# 在bar上通过 inet启动

ericksun@centos7-dev:~$ erl -name bar@127.0.0.1 -id foo -hosts 127.0.0.1 -loader inet -setcookie cookie -init_debug -emu_args -boot basestation
Executing: /home/ericksun/program/otp-25.0.4/lib/erlang/erts-13.0.4/bin/beam.smp /home/ericksun/program/otp-25.0.4/lib/erlang/erts-13.0.4/bin/beam.smp -- -root /home/ericksun/program/otp-25.0.4/lib/erlang -bindir /home/ericksun/program/otp-25.0.4/lib/erlang/erts-13.0.4/bin -progname erl -- -home /home/ericksun -- -
name bar@127.0.0.1 -id foo -hosts 127.0.0.1 -loader inet -setcookie cookie -init_debug -boot basestation

{progress,preloaded}
{progress,kernel_load_completed}
{progress,modules_loaded}
{start,heart}
{start,logger}
{start,application_controller}
{progress,init_kernel_started}
{apply,{application,load,[{application,stdlib,[{description,"ERTS  CXC 138 10"},{vsn,"4.0.1"},{id,[]},{modules,[array,base64,beam_lib,binary,c,calendar,dets,d
ets_server,dets_sup,dets_utils,dets_v9,dict,digraph,digraph_utils,edlin,edlin_expand,epp,eval_bits,erl_abstract_code,erl_anno,erl_bits,erl_compile,erl_error,e
rl_eval,erl_expand_records,erl_features,erl_internal,erl_lint,erl_parse,erl_posix_msg,erl_pp,erl_scan,erl_stdlib_errors,erl_tar,error_logger_file_h,error_logg
er_tty_h,escript,ets,file_sorter,filelib,filename,gb_trees,gb_sets,gen,gen_event,gen_fsm,gen_server,gen_statem,io,io_lib,io_lib_format,io_lib_fread,io_lib_pre
tty,lists,log_mf_h,maps,math,ms_transform,orddict,ordsets,otp_internal,peer,pool,proc_lib,proplists,qlc,qlc_pt,queue,rand,random,re,sets,shell,shell_default,s
hell_docs,slave,sofs,string,supervisor,supervisor_bridge,sys,timer,unicode,unicode_util,uri_string,win32reg,zip]},{registered,[timer_server,rsh_starter,take_o
ver_monitor,pool_master,dets]},{applications,[kernel]},{optional_applications,[]},{included_applications,[]},{env,[]},{maxT,infinity},{maxP,infinity}]}]}}
{apply,{application,load,[{application,sasl,[{description,"SASL  CXC 138 11"},{vsn,"4.2"},{id,[]},{modules,[sasl,alarm_handler,format_lib_supp,misc_supp,rb,rb
_format_supp,release_handler,release_handler_1,erlsrv,sasl_report,sasl_report_tty_h,sasl_report_file_h,systools,systools_make,systools_rc,systools_relup,systo
ols_lib]},{registered,[sasl_sup,alarm_handler,release_handler]},{applications,[kernel,stdlib]},{optional_applications,[]},{included_applications,[]},{env,[]},
{maxT,infinity},{maxP,infinity},{mod,{sasl,[]}}]}]}}
{apply,{application,load,[{application,erts,[{description,"ERTS  CXC 138 10"},{vsn,"13.0.4"},{id,[]},{modules,[erlang,erl_prim_loader,erts_internal,init,erl_i
nit,erts_code_purger,prim_buffer,prim_eval,prim_file,prim_inet,prim_zip,atomics,counters,persistent_term,prim_net,prim_socket,socket_registry,zlib]},{register
ed,[]},{applications,[]},{optional_applications,[]},{included_applications,[]},{env,[]},{maxT,infinity},{maxP,infinity}]}]}}
{apply,{application,load,[{application,bsc,[{description,"Base Station Controller"},{vsn,"1.0"},{id,[]},{modules,[bsc,bsc_sup,frequency,freq_overload,my_logge
r,my_counters,hlr,simple_phone_sup,phone_fsm]},{registered,[bsc_sup,frequency,freq_overload,simple_phone_sup]},{applications,[kernel,stdlib,sasl]},{optional_a
pplications,[]},{included_applications,[]},{env,[]},{maxT,infinity},{maxP,infinity},{mod,{bsc,[]}}]}]}}
{progress,applications_loaded}
{apply,{application,start_boot,[kernel,permanent]}}
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1]

{apply,{application,start_boot,[stdlib,permanent]}}
{apply,{application,start_boot,[sasl,permanent]}}
{apply,{application,start_boot,[erts,permanent]}}
{apply,{application,start_boot,[bsc,permanent]}}
{apply,{c,erlangrc,[]}}
{progress,started}
Eshell V13.0.4  (abort with ^G)
(bar@127.0.0.1)1> application:which_applications().
[{bsc,"Base Station Controller","1.0"},
 {erts,"ERTS  CXC 138 10","13.0.4"},
 {sasl,"SASL  CXC 138 11","4.2"},
 {stdlib,"ERTS  CXC 138 10","4.0.1"},
 {kernel,"ERTS  CXC 138 10","8.4.2"}]
(bar@127.0.0.1)2>

