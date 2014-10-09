
http://visualgdb.com/gdbreference/commands/set_auto-solib-add


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
(gdb) list
1       /************关于本文档********************************************
2        *filename: pk.cpp
3        *********************************************************************/
4       #include <stdio.h>
5       #include "get.h"
6       int main (int argc, char** argv)
7       {
8               int a = 100;
9               int b = get ();
10              int c = set (a);
(gdb) b main
Breakpoint 1 at 0x80485d5: file main.cpp, line 8.
(gdb) b 9
Breakpoint 2 at 0x80485dd: file main.cpp, line 9.
(gdb) b set
Breakpoint 3 at 0x8048490
(gdb) run
Starting program: /root/programming/c/gdb/so_debug/main

Breakpoint 1, main (argc=1, argv=0xbffff774) at main.cpp:8
8               int a = 100;
(gdb) info shared
From        To          Syms Read   Shared Object Library
0xb7fe2820  0xb7ff905f  Yes (*)     /lib/ld-linux.so.2
0xb7fdd480  0xb7fdd614  Yes         /root/programming/c/gdb/so_debug/libggg.so
0xb7e9bc80  0xb7f99c5c  Yes (*)     /lib/i386-linux-gnu/libc.so.6
0xb7de3040  0xb7e52af9  Yes (*)     /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d75460  0xb7d90398  Yes (*)     /lib/i386-linux-gnu/libm.so.6
0xb7d574b0  0xb7d6dce4  Yes (*)     /lib/i386-linux-gnu/libgcc_s.so.1
(*): Shared library is missing debugging information.
(gdb) n

Breakpoint 2, main (argc=1, argv=0xbffff774) at main.cpp:9
9               int b = get ();
(gdb) info shared
From        To          Syms Read   Shared Object Library
0xb7fe2820  0xb7ff905f  Yes (*)     /lib/ld-linux.so.2
0xb7fdd480  0xb7fdd614  Yes         /root/programming/c/gdb/so_debug/libggg.so
0xb7e9bc80  0xb7f99c5c  Yes (*)     /lib/i386-linux-gnu/libc.so.6
0xb7de3040  0xb7e52af9  Yes (*)     /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d75460  0xb7d90398  Yes (*)     /lib/i386-linux-gnu/libm.so.6
0xb7d574b0  0xb7d6dce4  Yes (*)     /lib/i386-linux-gnu/libgcc_s.so.1
(*): Shared library is missing debugging information.
(gdb) continue
Continuing.
get x=0

Breakpoint 3, set (a=100) at get.cpp:16
16              printf ("set a=%d\n", a);
(gdb)
------------------------------------------------------------------------------------------------



(gdb) start
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Temporary breakpoint 4 at 0x80485d5: file main.cpp, line 8.
Starting program: /root/programming/c/gdb/so_debug/main

Breakpoint 1, main (argc=1, argv=0xbffff774) at main.cpp:8
8               int a = 100;
(gdb) info shared
From        To          Syms Read   Shared Object Library
0xb7fe2820  0xb7ff905f  No          /lib/ld-linux.so.2
0xb7fdd480  0xb7fdd614  No          /root/programming/c/gdb/so_debug/libggg.so
0xb7e9bc80  0xb7f99c5c  No          /lib/i386-linux-gnu/libc.so.6
0xb7de3040  0xb7e52af9  No          /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d75460  0xb7d90398  No          /lib/i386-linux-gnu/libm.so.6
0xb7d574b0  0xb7d6dce4  No          /lib/i386-linux-gnu/libgcc_s.so.1
(gdb) set auto-solib-add off
(gdb) n

Breakpoint 2, main (argc=1, argv=0xbffff774) at main.cpp:9
9               int b = get ();
(gdb) info shared
From        To          Syms Read   Shared Object Library
0xb7fe2820  0xb7ff905f  No          /lib/ld-linux.so.2
0xb7fdd480  0xb7fdd614  No          /root/programming/c/gdb/so_debug/libggg.so
0xb7e9bc80  0xb7f99c5c  No          /lib/i386-linux-gnu/libc.so.6
0xb7de3040  0xb7e52af9  No          /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d75460  0xb7d90398  No          /lib/i386-linux-gnu/libm.so.6
0xb7d574b0  0xb7d6dce4  No          /lib/i386-linux-gnu/libgcc_s.so.1
(gdb) sharedlibrary
Reading symbols from /lib/ld-linux.so.2...(no debugging symbols found)...done.
Loaded symbols for /lib/ld-linux.so.2
Reading symbols from /root/programming/c/gdb/so_debug/libggg.so...done.
Loaded symbols for /root/programming/c/gdb/so_debug/libggg.so
Reading symbols from /lib/i386-linux-gnu/libc.so.6...(no debugging symbols found)...done.
Loaded symbols for /lib/i386-linux-gnu/libc.so.6
Reading symbols from /usr/lib/i386-linux-gnu/libstdc++.so.6...(no debugging symbols found)...done.
Loaded symbols for /usr/lib/i386-linux-gnu/libstdc++.so.6
Reading symbols from /lib/i386-linux-gnu/libm.so.6...(no debugging symbols found)...done.
Loaded symbols for /lib/i386-linux-gnu/libm.so.6
Reading symbols from /lib/i386-linux-gnu/libgcc_s.so.1...(no debugging symbols found)...done.
Loaded symbols for /lib/i386-linux-gnu/libgcc_s.so.1
(gdb) info shared
From        To          Syms Read   Shared Object Library
0xb7fe2820  0xb7ff905f  Yes (*)     /lib/ld-linux.so.2
0xb7fdd480  0xb7fdd614  Yes         /root/programming/c/gdb/so_debug/libggg.so
0xb7e9bc80  0xb7f99c5c  Yes (*)     /lib/i386-linux-gnu/libc.so.6
0xb7de3040  0xb7e52af9  Yes (*)     /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d75460  0xb7d90398  Yes (*)     /lib/i386-linux-gnu/libm.so.6
0xb7d574b0  0xb7d6dce4  Yes (*)     /lib/i386-linux-gnu/libgcc_s.so.1
(*): Shared library is missing debugging information.
(gdb)



