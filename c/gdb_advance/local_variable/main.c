#include <stdio.h>

int main()
{
	int x = 0x111;
	int y = 0x222;
	int z = 0;

	{
		int x = 0x333;
		int y = 0x444;
		z = x + y;
	}


	return 0;
}
// (gdb) disassemble  main
// Dump of assembler code for function main:
//    0x00000000004004b6 <+0>:     push   %rbp
//    0x00000000004004b7 <+1>:     mov    %rsp,%rbp
//    0x00000000004004ba <+4>:     movl   $0x111,-0x4(%rbp)
//    0x00000000004004c1 <+11>:    movl   $0x222,-0x8(%rbp)
//    0x00000000004004c8 <+18>:    movl   $0x0,-0xc(%rbp)
//    0x00000000004004cf <+25>:    movl   $0x333,-0x10(%rbp)
//    0x00000000004004d6 <+32>:    movl   $0x444,-0x14(%rbp)
//    0x00000000004004dd <+39>:    mov    -0x10(%rbp),%edx
//    0x00000000004004e0 <+42>:    mov    -0x14(%rbp),%eax
//    0x00000000004004e3 <+45>:    add    %edx,%eax
//    0x00000000004004e5 <+47>:    mov    %eax,-0xc(%rbp)
//    0x00000000004004e8 <+50>:    mov    $0x0,%eax
//    0x00000000004004ed <+55>:    pop    %rbp
//    0x00000000004004ee <+56>:    retq
// End of assembler dump.

