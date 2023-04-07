$ file src/b64.exe
src/b64.exe: PE32 executable for MS Windows (console) Intel 80386 32-bit

root@71ecbf31bd8e:~/programming/linux/autotool/mingw_on_linux/b64_my2# /usr/share/automake-1.16/config.guess
aarch64-unknown-linux-gnu


# compile windows
../configure --build=aarch64-unknown-linux-gnu --host=x86_64-w64-mingw32
../configure --build=aarch64-unknown-linux-gnu --host=x86_64-pc-linux-gnu 





x86_64-w64-mingw32-gcc -DHAVE_CONFIG_H -I. -I..     -g -O2 -MT src/b64.o -MD -MP -MF $depbase.Tpo -c -o src/b64.o ../src/b64.c &&\
mv -f $depbase.Tpo $depbase.Po
x86_64-w64-mingw32-gcc  -g -O2   -o src/b64.exe src/b64.o

