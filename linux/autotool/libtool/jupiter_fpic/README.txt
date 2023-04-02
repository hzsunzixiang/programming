当一个静态库被另一个静态库链接时，被链接的静态库仍然需要使用   -fPIC   选项进行编译。这是因为静态库的链接过程与动态库有所不同，每个静态库都被独立地链接到最终的可执行文件或者另一个静态库中。如果被链接的静态库没有使用   -fPIC   编译选项，那么在链接时就会出现位置相关错误（position dependent errors），导致程序无法正常运行。
下面以一个简单的例子来说明。假设有两个静态库   liba.a   和   libb.a  ，其中   liba.a   使用了   -fPIC   选项进行编译，而   libb.a   没有使用   -fPIC   选项进行编译。现在我们想要使用这两个静态库构建一个可执行文件   app  。
gcc -o app main.c -L. -la -lb
在链接时，如果   libb.a   没有使用   -fPIC   选项进行编译，那么链接器就会报错，例如：
/usr/bin/ld: libb.a(b.o): relocation R_X86_64_PC32 against undefined symbol `foo' can not be used when making a shared object; recompile with -fPIC
这是因为   libb.a   中的某个目标文件   b.o   引用了一个在   liba.a   中定义的符号   foo  ，而   libb.a   没有使用   -fPIC   编译选项，导致   libb.a   中的符号表位置相关，无法正确链接。因此，在构建静态库时，如果可能会被链接到动态库中，建议始终使用   -fPIC   选项进行编译，以保证最终链接的可执行文件或者动态库的正确性。

