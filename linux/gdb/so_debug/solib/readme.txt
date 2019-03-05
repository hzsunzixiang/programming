root@debian-1:~/programming/c/gdb/so_debug/solib# gdb main

Reading symbols from /root/programming/c/gdb/so_debug/solib/main...done.
(gdb) info sharedlibrary
No shared libraries loaded at this time.
(gdb) start
Temporary breakpoint 1 at 0x80485d5: file main.cpp, line 10.
Starting program: /root/programming/c/gdb/so_debug/solib/main
i
Temporary breakpoint 1, main (argc=1, argv=0xbffff7e4) at main.cpp:10
10              int a = 100;
(gdb) info sharedlibrary
From        To          Syms Read   Shared Object Library
0xb7fe2820  0xb7ff905f  Yes (*)     /lib/ld-linux.so.2
0xb7fdd480  0xb7fdd614  Yes         ../libggg.so    #  关注这里
0xb7e9dc60  0xb7f9c41c  Yes         /lib/i386-linux-gnu/libc.so.6
0xb7de5040  0xb7e54af9  Yes (*)     /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d77460  0xb7d92398  Yes         /lib/i386-linux-gnu/libm.so.6
0xb7d594b0  0xb7d6fce4  Yes (*)     /lib/i386-linux-gnu/libgcc_s.so.1
(*): Shared library is missing debugging information.

