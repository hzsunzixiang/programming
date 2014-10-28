   gcc -c it.c
gcc -shared -Wall -fPIC -o libit.so it.o

1. $ gcc -o lt.o -c lt.c 2. $ gcc -shared -Wall -fPIC -o liblt.so lt.o -shared 该选项指定生成动态连接库(让连接器生成T类型的导出符号表，有时候也生成弱连接W类型的导出符号)，不用该标志外部程序无法连接。相当于一个可执行文件 -fPIC：表示编译为位置独立的代码，不用此选项的话编译后的代码是位置相关的所以动态载入时是通过代码拷贝的方式来满足不同进程的需要，而不能达到真正代码段共享的目的。
       -fPIC
           If supported for the target machine, emit position-independent code, suitable for dynamic
           linking and avoiding any limit on the size of the global offset table.  This option makes a
           difference on the m68k, PowerPC and SPARC.

           Position-independent code requires special support, and therefore works only on certain
           machines.

           When this flag is set, the macros "__pic__" and "__PIC__" are defined to 2.
hazza@hazza-desktop:~/GCC/dyn$ ldd libit.so 
	linux-gate.so.1 =>  (0xb77f0000)
	libc.so.6 => /lib/tls/i686/cmov/libc.so.6 (0xb767a000)
	/lib/ld-linux.so.2 (0xb77f1000)
hazza@hazza-desktop:~/GCC/dyn$ ldd it.o
ldd: 警告：你没有执行权限： `./it.o'
	not a dynamic executable



blt.so 。

　　1. $ gcc -o lt.o -c lt.c 2. $ gcc -shared -Wall -fPIC -o liblt.so lt.o -shared 该选项指定生成动态连接库(让连接器生成T类型的导出符号表，有时候也生成弱连接W类型的导出符号)，不用该标志外部程序无法连接。相当于一个可执行文件 -fPIC：表示编译为位置独立的代码，不用此选项的话编译后的代码是位置相关的所以动态载入时是通过代码拷贝的方式来满足不同进程的需要，而不能达到真正代码段共享的目的。

　　-L.：表示要连接的库在当前目录中-ltest：编译器查找动态连接库时有隐含的命名规则，即在给出的名字前面加上lib，后面加上.so来确定库的名称LD_LIBRARY_PATH：这个环境变量指示动态连接器可以装载动态库的路径。

　　链接方法I，拷贝到系统库里再链接，让gcc自己查找1. $ sudo cp liblt.so /usr/lib 2. $ gcc -o test test.o -llt这里我们可以看到了 -llt 选项，-l[lib_name] 指定库名，他会主动搜索lib[lib_name].so。这个搜索的路径可以通过 gcc --print-search-dirs来查找。

　　链接方法II，手动指定库路径1. $ cc -o test test.o -llt -B /path/to/lib这里的-B 选项就添加 /path/to/lib 到gcc搜索的路径之中。这样链接没有问题但是方法II中手动链接好的程序在执行时候仍旧需要指定库路径(链接和执行是分开的)。需要添加系

　　统变量LD_LIBRARY_PATH :

　　1. $ export LD_LIBRARY_PATH=/path/to/lib

　　这个时候再来检测一下test程序的库链接状况(方法I情况)

　　1. $ ldd test 2. linux-gate.so.1 => (0xffffe000) 3. liblt.so => /usr/lib/liblt.so (0xb7f58000) 4. libc.so.6 => /lib/libc.so.6 (0xb7e28000) 5. /lib/ld-linux.so.2 (0xb7f6f000)恩，是不是比静态链接的程序多了一个 liblt.so ?恩，这就是静态与动态的最大区别，静态情况下，他把库直接加载到程序里，而在动态链接的时候，他只是保留接口，将动态库与程序代码独立。这样就可以提高代码的可复用度，和降低程序的耦合度。

　　另外，运行时，要保证主程序能找到动态库，所以动态库一般发布到系统目录中，要么就在跟主程序相对很固定的路径里，这样不管主程序在本机何时何地跑，都能找得到动态库。而静态库只作用于链接时，运行主程序时，静态库文件没存在意义了。


gcc -o test test.c -B. -lit
gcc -o test test.c -lit -B 
hazza@hazza-desktop:~/GCC/dyn$ ldd test
	linux-gate.so.1 =>  (0xb7738000)
	libit.so => not found
	libc.so.6 => /lib/tls/i686/cmov/libc.so.6 (0xb75c5000)
	/lib/ld-linux.so.2 (0xb7739000)
hazza@hazza-desktop:~/GCC/dyn$ pwd
/home/hazza/GCC/dyn

hazza@hazza-desktop:~/GCC/dyn$ 
zza@hazza-desktop:~/GCC/dyn$ export LD_LIBRARY_PATH=/home/hazza/GCC/dyn

