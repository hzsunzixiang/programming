sum:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%ebp)
	movl	accum, %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, accum
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc

int accum = 0;

int sum(int x, int y)
{
	int t = x + y;
	accum += t;
	return t;
}

# call执行的时候会把返回地址入栈的
# ebp  然后ebp入栈

O0 code
080483cb <sum>:
80483cb:	55                   	push   %ebp
80483cc:	89 e5                	mov    %esp,%ebp
80483ce:	83 ec 10             	sub    $0x10,%esp
80483d1:	8b 55 08             	mov    0x8(%ebp),%edx         get x
80483d4:	8b 45 0c             	mov    0xc(%ebp),%eax         get y
80483d7:	01 d0                	add    %edx,%eax              get t 
80483d9:	89 45 fc             	mov    %eax,-0x4(%ebp)        save t
80483dc:	8b 15 d8 96 04 08    	mov    0x80496d8,%edx         get accum 
80483e2:	8b 45 fc             	mov    -0x4(%ebp),%eax        get t 
80483e5:	01 d0                	add    %edx,%eax              t + accum 
80483e7:	a3 d8 96 04 08       	mov    %eax,0x80496d8         get accum
80483ec:	8b 45 fc             	mov    -0x4(%ebp),%eax        return t
80483ef:	c9                   	leave  
80483f0:	c3                   	ret    


-----------下面是反汇编.o文件而不是可执行文件得到的值
code.o:     file format elf32-i386


Disassembly of section .text:

00000000 <sum>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 10             	sub    $0x10,%esp
   6:	8b 55 08             	mov    0x8(%ebp),%edx
   9:	8b 45 0c             	mov    0xc(%ebp),%eax
   c:	01 d0                	add    %edx,%eax
   e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  11:	8b 15 00 00 00 00    	mov    0x0,%edx                 the address of accum is undefined
  17:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1a:	01 d0                	add    %edx,%eax
  1c:	a3 00 00 00 00       	mov    %eax,0x0                 undefined
  21:	8b 45 fc             	mov    -0x4(%ebp),%eax
  24:	c9                   	leave  
  25:	c3                   	ret    






080483f1 <main>:
80483f1:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80483f5:	83 e4 f0             	and    $0xfffffff0,%esp
80483f8:	ff 71 fc             	pushl  -0x4(%ecx)
80483fb:	55                   	push   %ebp
80483fc:	89 e5                	mov    %esp,%ebp
80483fe:	51                   	push   %ecx
80483ff:	83 ec 04             	sub    $0x4,%esp
8048402:	83 ec 08             	sub    $0x8,%esp
8048405:	6a 03                	push   $0x3
8048407:	6a 01                	push   $0x1
8048409:	e8 bd ff ff ff       	call   80483cb <sum>     # call执行的时候会把返回地址入栈的
804840e:	83 c4 10             	add    $0x10,%esp
8048411:	8b 4d fc             	mov    -0x4(%ebp),%ecx
8048414:	c9                   	leave  
8048415:	8d 61 fc             	lea    -0x4(%ecx),%esp
8048418:	c3                   	ret    
8048419:	66 90                	xchg   %ax,%ax
804841b:	66 90                	xchg   %ax,%ax
804841d:	66 90                	xchg   %ax,%ax
804841f:	90                   	nop




