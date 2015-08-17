sum:
.LFB0:
	.cfi_startproc
	movl	8(%esp), %eax
	addl	4(%esp), %eax
	addl	%eax, accum
	ret


0x0 处存放返回地址(call的时候)，ebp在调用函数中保存，所以，不放在被调用函数中了

O1 code
080483cb <sum>:
80483cb:	8b 44 24 08          	mov    0x8(%esp),%eax        get y
80483cf:	03 44 24 04          	add    0x4(%esp),%eax        add x and y , get t  , t in eax , for return
80483d3:	01 05 ac 96 04 08    	add    %eax,0x80496ac        add t and accum, get t  
80483d9:	c3                   	ret    


-----------下面是反汇编.o文件而不是可执行文件得到的值

code.o:     file format elf32-i386


Disassembly of section .text:

00000000 <sum>:
   0:	8b 44 24 08          	mov    0x8(%esp),%eax
   4:	03 44 24 04          	add    0x4(%esp),%eax
   8:	01 05 00 00 00 00    	add    %eax,0x0                  the address of accum is not undefined
   e:	c3                   	ret    


080483da <main>:
 80483da:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 80483de:	83 e4 f0             	and    $0xfffffff0,%esp
 80483e1:	ff 71 fc             	pushl  -0x4(%ecx)
 80483e4:	55                   	push   %ebp
 80483e5:	89 e5                	mov    %esp,%ebp
 80483e7:	51                   	push   %ecx
 80483e8:	83 ec 0c             	sub    $0xc,%esp
 80483eb:	6a 03                	push   $0x3
 80483ed:	6a 01                	push   $0x1
 80483ef:	e8 d7 ff ff ff       	call   80483cb <sum>
 80483f4:	83 c4 10             	add    $0x10,%esp
 80483f7:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 80483fa:	c9                   	leave  
 80483fb:	8d 61 fc             	lea    -0x4(%ecx),%esp
 80483fe:	c3                   	ret    
 80483ff:	90                   	nop




int main()
{
	return sum(1, 3);

}

int accum = 0;

int sum(int x, int y)
{
	int t = x + y;
	accum += t;
	return t;
}

