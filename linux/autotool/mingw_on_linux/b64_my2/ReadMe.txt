$ file src/b64.exe
src/b64.exe: PE32 executable for MS Windows (console) Intel 80386 32-bit

root@71ecbf31bd8e:~/programming/linux/autotool/mingw_on_linux/b64_my2# /usr/share/automake-1.16/config.guess
aarch64-unknown-linux-gnu


# compile windows
../configure --build=aarch64-unknown-linux-gnu --host=x86_64-w64-mingw32
../configure --build=aarch64-unknown-linux-gnu --host=x86_64-pc-linux-gnu 




