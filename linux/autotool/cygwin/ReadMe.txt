./configure --build=x86_64-unknown-cygwin --host=i686-w64-mingw32
./configure --build=x86_64-unknown-cygwin --host=x86_64-w64-mingw32


# cygwin上运行的
./configure

ericksun@ericksun-NB1 /cygdrive/f/programming/linux/autotool/cygwin/b64_cygin/src
$ file b64.exe
b64.exe: PE32+ executable (console) x86-64, for MS Windows, 19 sections

ericksun@ericksun-NB1 /cygdrive/f/programming/linux/autotool/cygwin/b64_cygin/src
$ cygcheck ./b64.exe
F:\programming\linux\autotool\cygwin\b64_cygin\src\b64.exe
  C:\cygwin64\bin\cygwin1.dll
    C:\WINDOWS\system32\KERNEL32.dll
      C:\WINDOWS\system32\api-ms-win-core-rtlsupport-l1-1-0.dll
      C:\WINDOWS\system32\ntdll.dll
      C:\WINDOWS\system32\KERNELBASE.dll
      C:\WINDOWS\system32\api-ms-win-core-processthreads-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-processthreads-l1-1-1.dll
      C:\WINDOWS\system32\api-ms-win-core-heap-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-memory-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-handle-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-synch-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-synch-l1-2-0.dll
      C:\WINDOWS\system32\api-ms-win-core-file-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-file-l1-2-0.dll
      C:\WINDOWS\system32\api-ms-win-core-namedpipe-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-datetime-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-sysinfo-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-timezone-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-localization-l1-2-0.dll
      C:\WINDOWS\system32\api-ms-win-core-processenvironment-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-string-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-debug-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-errorhandling-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-util-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-profile-l1-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-file-l2-1-0.dll
      C:\WINDOWS\system32\api-ms-win-core-console-l1-1-0.dll
      D:\Program Files\Java\jdk-16.0.1\bin\api-ms-win-core-console-l1-2-0.dll


# 64位 windows
./configure --build=x86_64-unknown-cygwin --host=x86_64-w64-mingw32

ericksun@ericksun-NB1 /cygdrive/f/programming/linux/autotool/cygwin/b64_cygin_mingw64/src
$ file b64.exe
b64.exe: PE32+ executable (console) x86-64, for MS Windows, 20 sections

ericksun@ericksun-NB1 /cygdrive/f/programming/linux/autotool/cygwin/b64_cygin_mingw64/src
$ cygcheck ./b64.exe
F:\programming\linux\autotool\cygwin\b64_cygin_mingw64\src\b64.exe
  C:\WINDOWS\system32\KERNEL32.dll
    C:\WINDOWS\system32\api-ms-win-core-rtlsupport-l1-1-0.dll
    C:\WINDOWS\system32\ntdll.dll
    C:\WINDOWS\system32\KERNELBASE.dll
    C:\WINDOWS\system32\api-ms-win-core-processthreads-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-processthreads-l1-1-1.dll
    C:\WINDOWS\system32\api-ms-win-core-heap-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-memory-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-handle-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-synch-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-synch-l1-2-0.dll
    C:\WINDOWS\system32\api-ms-win-core-file-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-file-l1-2-0.dll
    C:\WINDOWS\system32\api-ms-win-core-namedpipe-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-datetime-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-sysinfo-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-timezone-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-localization-l1-2-0.dll
    C:\WINDOWS\system32\api-ms-win-core-processenvironment-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-string-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-debug-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-errorhandling-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-util-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-profile-l1-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-file-l2-1-0.dll
    C:\WINDOWS\system32\api-ms-win-core-console-l1-1-0.dll
    D:\Program Files\Java\jdk-16.0.1\bin\api-ms-win-core-console-l1-2-0.dll
  C:\WINDOWS\system32\msvcrt.dll





# 32位 windows 
./configure --build=x86_64-unknown-cygwin --host=i686-w64-mingw32


ericksun@ericksun-NB1 /cygdrive/f/programming/linux/autotool/cygwin/b64_cygin_mingw32/src
$ cygcheck ./b64.exe
F:\programming\linux\autotool\cygwin\b64_cygin_mingw32\src\b64.exe


ericksun@ericksun-NB1 /cygdrive/f/programming/linux/autotool/cygwin/b64_cygin_mingw32/src
$ file b64.exe
b64.exe: PE32 executable (console) Intel 80386, for MS Windows, 18 sections


# 三种代码均能在 cygwin下面运行
ericksun@ericksun-NB1 /cygdrive/f/programming/linux/autotool/cygwin/b64_cygin_mingw32/src
$ ./b64 < ../Makefile.am
QUNMT0NBTF9BTUZMQUdTID0gLUkgbTQKRVhUUkFfRElTVCA9IG00L2dudWxpYi1jYWNoZS5tNApTVUJESVJTID0gbGliCgpiaW5fUFJPR1JBTVMgPSBzcmMvYjY0CnNyY19iNjRfU09VUkNFUyA9IHNyYy9iNjQuYwpzcmNfYjY0X0NQUEZMQUdTID0gLUkkKHRvcF9idWlsZGRpcikvbGliIC1JJCh0b3Bfc3JjZGlyKS9saWIKc3JjX2I2NF9MREFERCA9IGxpYi9saWJnbnUuYQo=

sun@ericksun-NB1 /cygdrive/f/programming/linux/autotool/cygwin/b64_cygin/src
$ ./b64 < ../Makefile.am
QUNMT0NBTF9BTUZMQUdTID0gLUkgbTQKRVhUUkFfRElTVCA9IG00L2dudWxpYi1jYWNoZS5tNApTVUJESVJTID0gbGliCgpiaW5fUFJPR1JBTVMgPSBzcmMvYjY0CnNyY19iNjRfU09VUkNFUyA9IHNyYy9iNjQuYwpzcmNfYjY0X0NQUEZMQUdTID0gLUkkKHRvcF9idWlsZGRpcikvbGliIC1JJCh0b3Bfc3JjZGlyKS9saWIKc3JjX2I2NF9MREFERCA9IGxpYi9saWJnbnUuYQo=

ericksun@ericksun-NB1 /cygdrive/f/programming/linux/autotool/cygwin/b64_cygin/src
$ ./b64 < ../Makefile.am
QUNMT0NBTF9BTUZMQUdTID0gLUkgbTQKRVhUUkFfRElTVCA9IG00L2dudWxpYi1jYWNoZS5tNApTVUJESVJTID0gbGliCgpiaW5fUFJPR1JBTVMgPSBzcmMvYjY0CnNyY19iNjRfU09VUkNFUyA9IHNyYy9iNjQuYwpzcmNfYjY0X0NQUEZMQUdTID0gLUkkKHRvcF9idWlsZGRpcikvbGliIC1JJCh0b3Bfc3JjZGlyKS9saWIKc3JjX2I2NF9MREFERCA9IGxpYi9saWJnbnUuYQo=
