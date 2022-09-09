perl -i -pe 's/0\.1\.0/1.0/' ./apps/bsc/src/bsc.app.src ./rebar.config

cp  -v ~/program/programming/erlang/my_erlang/release/ch11/bsc/src/*.erl apps/bsc/src

# 注意，需要对logger.erl 重命名，不然跟系统的冲突

_build/default/rel/bsc/bin/bsc
#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ _build/default/rel/bsc/bin/bsc
#
#Usage: bsc [COMMAND] [ARGS]
#
#Commands:
#
#  foreground              Start release with output to stdout
#  remote_console          Connect remote shell to running node
#  rpc [Mod [Fun [Args]]]] Run apply(Mod, Fun, Args) on running node
#  eval [Exprs]            Run expressions on running node
#  stop                    Stop the running node
#  restart                 Restart the applications but not the VM
#  reboot                  Reboot the entire VM
#  pid                     Print the PID of the OS process
#  ping                    Print pong if the node is alive
#  console                 Start the release with an interactive shell
#  console_clean           Start an interactive shell without the release's applications
#  console_boot [File]     Start an interactive shell for boot script [File]
#  daemon                  Start release in the background with run_erl (named pipes)
#  daemon_boot [File]      Start boot script [File] in the background with run_erl (named pipes)
#  daemon_attach           Connect to node started as daemon with to_erl (named pipes)
#  upgrade [Version]       Upgrade the running release to a new version
#  downgrade [Version]     Downgrade the running release to a new version
#  install [Version]       Install a release
#  uninstall [Version]     Uninstall a release
#  unpack [Version]        Unpack a release tarball
#  versions                Print versions of the release available
#  escript                 Run an escript in the same environment as the release
#  status                  Verify node is running and then run status hook scripts
#  undefined

#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ rebar3 as prod release
#===> Verifying dependencies...
#===> Analyzing applications...
#===> Compiling bsc
#===> Assembling release bsc-1.0...
#===> Release successfully assembled: _build/prod/rel/bsc

rebar3 as prod release

#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ ls _build/prod/rel/bsc
#bin  erts-12.2  lib  releases

#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ rebar3 as prod tar
#===> Verifying dependencies...
#===> Analyzing applications...
#===> Compiling bsc
#===> Assembling release bsc-1.0...
#===> Release successfully assembled: _build/prod/rel/bsc
#===> Building release tarball bsc-1.0.tar.gz...
#===> Tarball successfully created: _build/prod/rel/bsc/bsc-1.0.tar.gz



# 注意这里特别困惑，可能是网络原因，要不停的重试
#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ rebar3 deps
#===> Verifying dependencies...
#=NOTICE REPORT==== 9-Sep-2022::18:37:43.583916 ===
#TLS client: In state hello at tls_record.erl:564 generated CLIENT ALERT: Fatal - Unexpected Message
# - {unsupported_record_type,72}
#===> Failed to update package goldrush from repo hexpm
#===> Package not found in any repo: goldrush 0.1.9
#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ rebar3 deps
#===> Verifying dependencies...
#=NOTICE REPORT==== 9-Sep-2022::18:37:55.799736 ===
#TLS client: In state hello at tls_record.erl:564 generated CLIENT ALERT: Fatal - Unexpected Message
# - {unsupported_record_type,72}
#===> Failed to update package goldrush from repo hexpm
#===> Package not found in any repo: goldrush 0.1.9
#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ fg
#vim rebar.config
#
#[1]+  Stopped                 vim rebar.config
#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ rebar3 deps
#===> Verifying dependencies...
#=NOTICE REPORT==== 9-Sep-2022::18:38:15.902274 ===
#TLS client: In state hello at tls_record.erl:564 generated CLIENT ALERT: Fatal - Unexpected Message
# - {unsupported_record_type,72}
#===> Failed to update package goldrush from repo hexpm
#===> Package not found in any repo: goldrush 0.1.9
#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ rebar3 deps
#===> Verifying dependencies...
#===> Skipping goldrush v0.1.9 as an app of the same name has already been fetched
#goldrush (git source master)
#lager (git source master)
#
#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ rebar3 deps
#===> Verifying dependencies...
#===> Skipping goldrush v0.1.9 as an app of the same name has already been fetched
#goldrush (git source master)
#lager (git source master)

# 不再添加 间接依赖，rebar3会自动处理
#github@9.134.165.238:~/program/programming/erlang/my_erlang/release/rebar3/ernie2/bsc (master)$ rebar3 deps
#===> Verifying dependencies...
#===> Fetching lager (from {git,"https://github.com/erlang-lager/lager",{branch,"master"}})
#===> Fetching goldrush v0.1.9
#lager (git source master)

