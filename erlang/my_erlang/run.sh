$ "D:\Program Files\erl-24.2\bin\erl.exe" -pa D:/erlang/helloworld/out/production/helloworld -pa D:/erlang/helloworld -eval "hello:start()." -s init stop -noshell
Hello, world!

erl -s hello start -noshell -s init stop


ericksun@debian-1:~/programming/erlang/my_erlang$ erl  -pa  /home/ericksun/programming/erlang/my_erlang -eval 'hello:hello_world().' -s init stop -noshell
Hello, World!

windows 下执行
ericksun@ericksun-NB1 MINGW64 /d/erlang/helloworld/out/production/helloworld
$ erl -s hello start -noshell -s init stop
Hello, world!

===========================================
linux探秘

# 这种新式会后台起一个beam进程，没有输出
erl -detached -s hello hello_world

# 这种直接运行 而且会自动退出
erl  -eval 'hello:hello_world().' -s init stop -noshell

# 这样也会执行，但是会hang住，不会退出
erl -detached -s hello hello_world -noshell

# 这样，执行之后 ，有输出，而且会自动退出，完美
 erl -s hello hello_world -noshell -s init stop

strace 跟踪特定的系统调用，完美，以后socket就这样跟踪
ericksun@debian-1:~/programming/erlang/my_erlang$ strace -e write erl -s hello hello_world -noshell -s init stop
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=2121, si_uid=1000, si_status=0, si_utime=0, si_stime=0} ---
write(15, "\0\0\0\0", 4)                = 4
Hello, World!
+++ exited with 0 +++

         -detached:
           Starts the Erlang runtime system detached from the system console. Useful for running daemons and backgrounds processes. Implies -noinput.

         -noinput:
           Ensures that the Erlang runtime system never tries to read any input. Implies -noshell.

         -noshell:
           Starts an Erlang runtime system with no shell. This flag makes it possible to have the Erlang runtime system as a component in a series of Unix
           pipes.

         -s Mod [Func [Arg1, Arg2, ...]] (init flag):
           Makes  init call the specified function. Func defaults to start. If no arguments are provided, the function is assumed to be of arity 0. Other‐
           wise it is assumed to be of arity 1, taking the list [Arg1,Arg2,...] as argument. All arguments are passed as atoms. See init(3erl).






