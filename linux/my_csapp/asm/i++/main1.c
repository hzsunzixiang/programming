

int main()
{
	int i = 11;
	int a = i++;

	return 0;
}




// (gdb) disassemble main                                                                     
// Dump of assembler code for function main:                                                  
//    0x080483cb <+0>:     push   %ebp                                                        
//    0x080483cc <+1>:     mov    %esp,%ebp                                                       
//    0x080483ce <+3>:     sub    $0x10,%esp                                                  
//    0x080483d1 <+6>:     movl   $0xb,-0x4(%ebp)      #        -0x4(%ebp) 存放变量 i                                      
//    0x080483d8 <+13>:    mov    -0x4(%ebp),%eax      #        变量放入寄存器                                       
//    0x080483db <+16>:    lea    0x1(%eax),%edx       #        对变量值+1  放入寄存器 edx                                      
//    0x080483de <+19>:    mov    %edx,-0x4(%ebp)      #        把edx寄存器中的值放入变量i  -0x4(%ebp)                                      
//    0x080483e1 <+22>:    mov    %eax,-0x8(%ebp)      #        寄存器eax中的  放入变量a                                       
//    0x080483e4 <+25>:    mov    $0x0,%eax            #        return 0                                   
//    0x080483e9 <+30>:    leave                                                              
//    0x080483ea <+31>:    ret                                                                
// End of assembler dump.   
