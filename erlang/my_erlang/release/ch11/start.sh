mkdir -p bin
cp erts-8.3.5.3/bin/start.src bin/start
cp erts-8.3.5.3/bin/start_erl.src bin/start_erl
cp erts-8.3.5.3/bin/run_erl bin
cp erts-8.3.5.3/bin/to_erl bin
mkdir -p log


perl -i -pe "s#%FINAL_ROOTDIR%#$PWD#" bin/start
diff erts-8.3.5.3/bin/start.src bin/start
echo '8.3.5.3 1.0' > releases/start_erl.data


# 包里面的内容复制不全，没有包含hrl等
# Reason:     {undef,^M
#                 [{hlr,new,[],[]},^M
#                  {simple_phone_sup,init,1,^M
#                      [{file,"simple_phone_sup.erl"},{line,11}]},^M
#                  {supervisor,init,1,[{file,"supervisor.erl"},{line,294}]},^M
#                  {gen_server,init_it,6,^M
#                      [{file,"gen_server.erl"},{line,328}]},^M
#                  {proc_lib,init_p_do_apply,3,^M
#                      [{file,"proc_lib.erl"},{line,247}]}]}^M
# ericksun@centos7-dev:~/programming/erlang/my_erlang/release/ch11/ernie (master)$ ls ./lib/bsc-1.0/ebin/ -lh
# total 32K
# -rw-r--r--. 1 ericksun ericksun  378 Sep  8 04:05 bsc.app
# -rw-rw-r--. 1 ericksun ericksun  668 Sep  8 05:03 bsc.beam
# -rw-rw-r--. 1 ericksun ericksun 1.1K Sep  8 05:03 bsc_sup.beam
# -rw-rw-r--. 1 ericksun ericksun 1.2K Sep  8 05:03 freq_overload.beam
# -rw-rw-r--. 1 ericksun ericksun 2.1K Sep  8 05:03 frequency.beam
# -rw-rw-r--. 1 ericksun ericksun 1.6K Sep  8 05:03 logger.beam
# -rw-rw-r--. 1 ericksun ericksun 3.6K Sep  8 05:03 phone_fsm.beam
# -rw-rw-r--. 1 ericksun ericksun 1.2K Sep  8 05:03 simple_phone_sup.beam
# 
# ericksun@centos7-dev:~/programming/erlang/my_erlang/release/ch11/ernie (master)$ ls ../bsc/ebin/ -lh
# total 52K
# -rw-r--r--. 1 ericksun ericksun  378 Sep  8 04:05 bsc.app
# -rw-rw-r--. 1 ericksun ericksun  668 Sep  8 05:03 bsc.beam
# -rw-rw-r--. 1 ericksun ericksun 1.1K Sep  8 05:03 bsc_sup.beam
# -rw-rw-r--. 1 ericksun ericksun 1.2K Sep  8 05:03 counters.beam
# -rw-rw-r--. 1 ericksun ericksun 1.2K Sep  8 05:03 freq_overload.beam
# -rw-rw-r--. 1 ericksun ericksun 2.1K Sep  8 05:03 frequency.beam
# -rw-rw-r--. 1 ericksun ericksun 1.1K Sep  8 05:03 frequency_sup.beam
# -rw-rw-r--. 1 ericksun ericksun 1.2K Sep  8 05:03 hlr.beam
# -rw-rw-r--. 1 ericksun ericksun 1.6K Sep  8 05:03 logger.beam
# -rw-rw-r--. 1 ericksun ericksun 2.5K Sep  8 05:03 phone.beam
# -rw-rw-r--. 1 ericksun ericksun 3.6K Sep  8 05:03 phone_fsm.beam
# -rw-rw-r--. 1 ericksun ericksun 1.2K Sep  8 05:03 phone_sup.beam
# -rw-rw-r--. 1 ericksun ericksun 1.2K Sep  8 05:03 simple_phone_sup.beam

cp ../bsc/ebin/*.beam  ./lib/bsc-1.0/ebin/

bin/start
bin/to_erl /tmp/

