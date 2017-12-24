(gdb) disas
Dump of assembler code for function Foo2::~Foo2():
=> 0x0000000000400938 <+0>:     push   %rbp
   0x0000000000400939 <+1>:     mov    %rsp,%rbp
   0x000000000040093c <+4>:     sub    $0x10,%rsp
   0x0000000000400940 <+8>:     mov    %rdi,-0x8(%rbp)
   0x0000000000400944 <+12>:    mov    $0x400b17,%edi
   0x0000000000400949 <+17>:    callq  0x4006d0 <puts@plt>
   0x000000000040094e <+22>:    leaveq 
   0x000000000040094f <+23>:    retq   
End of assembler dump.




