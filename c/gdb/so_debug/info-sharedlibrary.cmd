
http://visualgdb.com/gdbreference/commands/info_sharedlibrary

The info sharedlibrary command is only valid when the debugged application has already started.

root@debian:~/programming/c/gdb/so_debug# gdb ./main
GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /root/programming/c/gdb/so_debug/main...done.
(gdb) info sharedlibrary
No shared libraries loaded at this time.
(gdb) start
Temporary breakpoint 1 at 0x80485d5: file main.cpp, line 8.
Starting program: /root/programming/c/gdb/so_debug/main

Temporary breakpoint 1, main (argc=1, argv=0xbffff774) at main.cpp:8
8               int a = 100;
(gdb) info sharedlibrary
From        To          Syms Read   Shared Object Library
0xb7fe2820  0xb7ff905f  Yes (*)     /lib/ld-linux.so.2
0xb7fdd480  0xb7fdd614  Yes         /root/programming/c/gdb/so_debug/libggg.so
0xb7e9bc80  0xb7f99c5c  Yes (*)     /lib/i386-linux-gnu/libc.so.6
0xb7de3040  0xb7e52af9  Yes (*)     /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d75460  0xb7d90398  Yes (*)     /lib/i386-linux-gnu/libm.so.6
0xb7d574b0  0xb7d6dce4  Yes (*)     /lib/i386-linux-gnu/libgcc_s.so.1
(*): Shared library is missing debugging information.
(gdb) info share
From        To          Syms Read   Shared Object Library
0xb7fe2820  0xb7ff905f  Yes (*)     /lib/ld-linux.so.2
0xb7fdd480  0xb7fdd614  Yes         /root/programming/c/gdb/so_debug/libggg.so
0xb7e9bc80  0xb7f99c5c  Yes (*)     /lib/i386-linux-gnu/libc.so.6
0xb7de3040  0xb7e52af9  Yes (*)     /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d75460  0xb7d90398  Yes (*)     /lib/i386-linux-gnu/libm.so.6
0xb7d574b0  0xb7d6dce4  Yes (*)     /lib/i386-linux-gnu/libgcc_s.so.1
(*): Shared library is missing debugging information.
(gdb)

