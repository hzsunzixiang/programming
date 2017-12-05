


int function3(int a, int b, int c, int d)
{
	return a+b+c*d;
}

int function2(int a, int b, int c, int d)
{
	return a+b-c*d;
}

int function1(int a, int b, int c)
{
	return function2(a, b, c, 10) + function3(c, a, b, 20); 
}

int main()
{
	function1(1, 2, 3);
	return 0;
}


                                                                                      
// (gdb) disassemble  main                                                               
// Dump of assembler code for function main:                                             
//    0x080483cb <+0>:     push   %ebp                                                   
//    0x080483cc <+1>:     mov    %esp,%ebp                                              
//    0x080483ce <+3>:     sub    $0x10,%esp                                             
//    0x080483d1 <+6>:     movl   $0x16,-0x4(%ebp)   #   -0x4(%ebp) 存放着变量的值                                  
//    0x080483d8 <+13>:    addl   $0x1,-0x4(%ebp)    # 对变量j  +1                                     
//    0x080483dc <+17>:    mov    -0x4(%ebp),%eax    # 变量放入寄存器   
//    0x080483df <+20>:    mov    %eax,-0x8(%ebp)    # 寄存器中的值 存放到变量b中                                    
//    0x080483e2 <+23>:    mov    $0x0,%eax                                              
//    0x080483e7 <+28>:    leave                                                         
//    0x080483e8 <+29>:    ret                                                           
// End of assembler dump.                                                                
                          
