strace -s99999 -f  erl -s write hello  -noshell -s init stop > strace_write.txt 2>&1
strace -s99999 -f erl -eval 'hello:add(2,3).' -noshell -s init stop  >strace_hello.txt 2>&1


