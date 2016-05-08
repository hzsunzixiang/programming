
-----------------------run运行之前 禁用动态符号-----------------------------------------------------

root@debian-1:~/programming/c/gdb/so_debug# gdb -q main
Reading symbols from /root/programming/c/gdb/so_debug/main...done.
(gdb) info sharedlibrary
No shared libraries loaded at this time.

(gdb) set auto-solib-add off
(gdb) start
Temporary breakpoint 1 at 0x80485d5: file main.cpp, line 8.
Starting program: /root/programming/c/gdb/so_debug/main

Temporary breakpoint 1, main (argc=1, argv=0xbffff7a4) at main.cpp:8
8               int a = 100;
(gdb) info sharedlibrary
From        To          Syms Read   Shared Object Library
0xb7fe2820  0xb7ff905f  No          /lib/ld-linux.so.2
0xb7fdd480  0xb7fdd614  No          libggg.so
0xb7e9dc60  0xb7f9c41c  No          /lib/i386-linux-gnu/libc.so.6
0xb7de5040  0xb7e54af9  No          /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d77460  0xb7d92398  No          /lib/i386-linux-gnu/libm.so.6
0xb7d594b0  0xb7d6fce4  No          /lib/i386-linux-gnu/libgcc_s.so.1
(gdb) nosharedlibrary
(gdb) info sharedlibrary
From        To          Syms Read   Shared Object Library
0xb7fdd480  0xb7fdd614  No          libggg.so
0xb7e9dc60  0xb7f9c41c  No          /lib/i386-linux-gnu/libc.so.6
0xb7de5040  0xb7e54af9  No          /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d77460  0xb7d92398  No          /lib/i386-linux-gnu/libm.so.6
0xb7d594b0  0xb7d6fce4  No          /lib/i386-linux-gnu/libgcc_s.so.1
0xb7fe2820  0xb7ff905f  No          /lib/ld-linux.so.2

-----------------------调试变量的时候-----------------------------------------------------

(gdb) info  variables     # 此时有很多很多变量在动态库中 全部加载
                                        # 只针对全局变量和静态变量
(gdb) nosharedlibrary
(gdb) info  variables
All defined variables:

(gdb) help info variables
All global and static variable names, or those matching REGEXP.

在run或者start之前 运行  set auto-solib-add off  会减少很多全局变量和静态变量
加载费动态库里面的全局或静态变量 这样看起来很清晰
(gdb) info  variables
All defined variables:

File main.cpp:
int g_x;

Non-debugging symbols:
。。。。
0x08049898  main::s_x
0x0804989c  __TMC_END__
0x0804989c  completed.5730


-------------------进入动态库内部的时候---------------------------------------------------------
(gdb) s
get x=0
set a=100
get x=100
a=100,b=0,c=100,d=100
[Inferior 1 (process 3436) exited normally]
warning: Error removing breakpoint 0
warning: Error removing breakpoint 0
warning: Error removing breakpoint 0
warning: Error removing breakpoint 0
warning: Error removing breakpoint 0
warning: Error removing breakpoint 0
warning: Error removing breakpoint -46
(gdb) info sharedlibrary
No shared libraries loaded at this time.


-------------------正在调试动态库的时候运行的过程中 nosharedlibrary 会卸载掉所有动态符号----------------
(gdb) info sharedlibrary
From        To          Syms Read   Shared Object Library
0xb7fe2820  0xb7ff905f  Yes (*)     /lib/ld-linux.so.2
0xb7fdd480  0xb7fdd614  Yes         libggg.so
0xb7e9dc60  0xb7f9c41c  Yes         /lib/i386-linux-gnu/libc.so.6
0xb7de5040  0xb7e54af9  Yes (*)     /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d77460  0xb7d92398  Yes         /lib/i386-linux-gnu/libm.so.6
0xb7d594b0  0xb7d6fce4  Yes (*)     /lib/i386-linux-gnu/libgcc_s.so.1
(*): Shared library is missing debugging information.
(gdb) nosharedlibrary libggg
(gdb) l
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
(gdb) n
Cannot find bounds of current function


(gdb) info sharedlibrary
From        To          Syms Read   Shared Object Library
0xb7fdd480  0xb7fdd614  No          libggg.so
0xb7e9dc60  0xb7f9c41c  No          /lib/i386-linux-gnu/libc.so.6
0xb7de5040  0xb7e54af9  No          /usr/lib/i386-linux-gnu/libstdc++.so.6
0xb7d77460  0xb7d92398  No          /lib/i386-linux-gnu/libm.so.6
0xb7d594b0  0xb7d6fce4  No          /lib/i386-linux-gnu/libgcc_s.so.1
0xb7fe2820  0xb7ff905f  No          /lib/ld-linux.so.2


重新载入动态符号表

(gdb) sharedlibrary
Reading symbols from libggg.so...done.
Loaded symbols for libggg.so
Reading symbols from /lib/i386-linux-gnu/libc.so.6...Reading symbols from /usr/lib/debug/lib/i386-linux-gnu/libc-2.13.so...done.
done.


------------------- ----------------

