


.section .text
.type a_add,@function
.globl a_add
a_add:
    pushl %ebp        #现场保护
    movl %esp,%ebp

    movl 8(%ebp),%eax #取得C函数传过来的参数
    pushl %ecx        #保护ecx，用作临时变量
    movl (%eax),%ecx  #取得指针所指的内容
    addl $1,%ecx      #将内容+1
    movl %ecx,(%eax)  #将内容放回指针所指的地方
    popl %ecx         #恢复ecx
    pushl %eax        #压桟，以便传参给C函数
    call c_add        #调用C函数

    addl $4,%esp      #清理局部变量
    popl %ebp         #恢复现场
    ret               #返回

# 上面这段代码完全可以由c语言生成

#
#	.file	"assembly.c"
#	.text
#	.globl	a_add
#	.type	a_add, @function
# a_add:
# .LFB0:
# 	.cfi_startproc
# 	pushl	%ebp
# 	.cfi_def_cfa_offset 8
# 	.cfi_offset 5, -8
# 	movl	%esp, %ebp
# 	.cfi_def_cfa_register 5
# 	subl	$8, %esp
# 	movl	8(%ebp), %eax
# 	movl	(%eax), %eax
# 	leal	1(%eax), %edx
# 	movl	8(%ebp), %eax
# 	movl	%edx, (%eax)
# 	subl	$12, %esp
# 	pushl	8(%ebp)
# 	call	c_add
# 	addl	$16, %esp
# 	leave
# 	.cfi_restore 5
# 	.cfi_def_cfa 4, 4
# 	ret
# 	.cfi_endproc
# .LFE0:
# 	.size	a_add, .-a_add
# 	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
# 	.section	.note.GNU-stack,"",@progbits
