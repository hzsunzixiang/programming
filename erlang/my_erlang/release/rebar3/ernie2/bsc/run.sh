perl -i -pe 's/0\.1\.0/1.0/' ./apps/bsc/src/bsc.app.src ./rebar.config

cp  -v ~/program/programming/erlang/my_erlang/release/ch11/bsc/src/*.erl apps/bsc/src

# 注意，需要对logger.erl 重命名，不然跟系统的冲突


