

https://eli.thegreenplace.net/2013/03/04/flexible-runtime-interface-to-shared-libraries-with-libffi/
Flexible runtime interface to shared libraries with libffi

# 添加选项 -ldl
gcc -g  -Wall -ldl $< -o $@

/tmp/ccSP4FIY.o: In function `main':
/home/ericksun/programming/python/ctypes/main.c:12: undefined reference to `dlopen'
/home/ericksun/programming/python/ctypes/main.c:14: undefined reference to `dlerror'
/home/ericksun/programming/python/ctypes/main.c:22: undefined reference to `dlsym'
/home/ericksun/programming/python/ctypes/main.c:23: undefined reference to `dlerror'
collect2: error: ld returned 1 exit status


# 
dlopen error: ./libsomelib.so: only ET_DYN and ET_EXEC can be loaded
https://stackoverflow.com/questions/38260351/exposing-c-class-in-python-only-et-dyn-and-et-exec-can-be-loaded/38888735

so库编译不能加-c
I've long forgotten about this problem and got to revisit this issue today.
I found two problems. The first problem was that I gave -c option which made the compiler only compile the source and not link. 


sudo aptitude install libffi-dev

