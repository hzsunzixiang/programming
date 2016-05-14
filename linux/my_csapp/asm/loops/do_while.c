
int fact_do(int n)
{
	int result = 1;
	do {
		result *= n;
		n = n -1;
	} while (n > 1);
	return result;
}


int main()
{
	fact_do(10);
	return 0;
}



// (gdb) disassemble  fact_do                                                  
// Dump of assembler code for function fact_do:                                
//    0x080483cb <+0>:     push   %ebp                                         
//    0x080483cc <+1>:     mov    %esp,%ebp                                    
//    0x080483ce <+3>:     sub    $0x10,%esp                                   
//    0x080483d1 <+6>:     movl   $0x1,-0x4(%ebp)            # -0x4(%ebp)  存放结果值                 
//    0x080483d8 <+13>:    mov    -0x4(%ebp),%eax            # 取出栈中值放到寄存器中                          
//    0x080483db <+16>:    imul   0x8(%ebp),%eax             # 计算得到的值放到寄存器 0x8(%ebp) 中存放结果值
//    0x080483df <+20>:    mov    %eax,-0x4(%ebp)            # 再把计算出来的值放入栈中 
//    0x080483e2 <+23>:    subl   $0x1,0x8(%ebp)             # 0x8(%ebp)   中存放结果值    在这里递减1      
//    0x080483e6 <+27>:    cmpl   $0x1,0x8(%ebp)             # 比较  做相应跳转                   
//    0x080483ea <+31>:    jg     0x80483d8 <fact_do+13>     # 跳转循环                  
//    0x080483ec <+33>:    mov    -0x4(%ebp),%eax            # 返回值                  
//    0x080483ef <+36>:    leave                                               
//    0x080483f0 <+37>:    ret                                                 
// End of assembler dump.  
