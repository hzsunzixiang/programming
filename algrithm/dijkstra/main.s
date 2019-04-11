	.file	"main.cpp"
	.text
.Ltext0:
	.globl	_Z11minDistancePiPb
	.type	_Z11minDistancePiPb, @function
_Z11minDistancePiPb:
.LFB0:
	.file 1 "main.cpp"
	.loc 1 13 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 15 0
	movl	$2147483647, -4(%rbp)
.LBB2:
	.loc 1 17 0
	movl	$0, -12(%rbp)
.L4:
	.loc 1 17 0 is_stmt 0 discriminator 1
	cmpl	$8, -12(%rbp)
	jg	.L2
	.loc 1 18 0 is_stmt 1
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L3
	.loc 1 18 0 is_stmt 0 discriminator 1
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-4(%rbp), %eax
	jg	.L3
	.loc 1 19 0 is_stmt 1
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
.L3:
	.loc 1 17 0 discriminator 2
	addl	$1, -12(%rbp)
	jmp	.L4
.L2:
.LBE2:
	.loc 1 21 0
	movl	-8(%rbp), %eax
	.loc 1 22 0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z11minDistancePiPb, .-_Z11minDistancePiPb
	.section	.rodata
.LC1:
	.string	"Vertex   Distance from Source"
.LC2:
	.string	"%d tt %d\n"
	.text
	.globl	_Z13printSolutionPii
	.type	_Z13printSolutionPii, @function
_Z13printSolutionPii:
.LFB1:
	.loc 1 26 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	.loc 1 27 0
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.LBB3:
	.loc 1 28 0
	movl	$0, -4(%rbp)
.L8:
	.loc 1 28 0 is_stmt 0 discriminator 3
	cmpl	$8, -4(%rbp)
	jg	.L9
	.loc 1 29 0 is_stmt 1 discriminator 2
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 28 0 discriminator 2
	addl	$1, -4(%rbp)
	jmp	.L8
.L9:
.LBE3:
	.loc 1 30 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z13printSolutionPii, .-_Z13printSolutionPii
	.globl	_Z8dijkstraPA9_ii
	.type	_Z8dijkstraPA9_ii, @function
_Z8dijkstraPA9_ii:
.LFB2:
	.loc 1 35 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movl	%esi, -92(%rbp)
.LBB4:
	.loc 1 43 0
	movl	$0, -4(%rbp)
.L12:
	.loc 1 43 0 is_stmt 0 discriminator 3
	cmpl	$8, -4(%rbp)
	jg	.L11
	.loc 1 44 0 is_stmt 1 discriminator 2
	movl	-4(%rbp), %eax
	cltq
	movl	$2147483647, -64(%rbp,%rax,4)
	movl	-4(%rbp), %eax
	cltq
	movb	$0, -73(%rbp,%rax)
	.loc 1 43 0 discriminator 2
	addl	$1, -4(%rbp)
	jmp	.L12
.L11:
.LBE4:
	.loc 1 47 0
	movl	-92(%rbp), %eax
	cltq
	movl	$0, -64(%rbp,%rax,4)
.LBB5:
	.loc 1 50 0
	movl	$0, -8(%rbp)
.L17:
	.loc 1 50 0 is_stmt 0 discriminator 1
	cmpl	$7, -8(%rbp)
	jg	.L13
.LBB6:
	.loc 1 54 0 is_stmt 1
	leaq	-73(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z11minDistancePiPb
	movl	%eax, -16(%rbp)
	.loc 1 57 0
	movl	-16(%rbp), %eax
	cltq
	movb	$1, -73(%rbp,%rax)
.LBB7:
	.loc 1 60 0
	movl	$0, -12(%rbp)
.L16:
	.loc 1 60 0 is_stmt 0 discriminator 1
	cmpl	$8, -12(%rbp)
	jg	.L14
	.loc 1 65 0 is_stmt 1
	movl	-12(%rbp), %eax
	cltq
	movzbl	-73(%rbp,%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L15
	.loc 1 65 0 is_stmt 0 discriminator 1
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	testl	%eax, %eax
	je	.L15
	.loc 1 65 0 discriminator 2
	movl	-16(%rbp), %eax
	cltq
	movl	-64(%rbp,%rax,4), %eax
	cmpl	$2147483647, %eax
	je	.L15
	.loc 1 66 0 is_stmt 1
	movl	-16(%rbp), %eax
	cltq
	movl	-64(%rbp,%rax,4), %ecx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	leal	(%rcx,%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	movl	-64(%rbp,%rax,4), %eax
	cmpl	%eax, %edx
	jge	.L15
	.loc 1 67 0
	movl	-16(%rbp), %eax
	cltq
	movl	-64(%rbp,%rax,4), %ecx
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	leal	(%rcx,%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	movl	%edx, -64(%rbp,%rax,4)
.L15:
	.loc 1 60 0 discriminator 2
	addl	$1, -12(%rbp)
	jmp	.L16
.L14:
.LBE7:
.LBE6:
	.loc 1 50 0 discriminator 2
	addl	$1, -8(%rbp)
	jmp	.L17
.L13:
.LBE5:
	.loc 1 71 0
	leaq	-64(%rbp), %rax
	movl	$9, %esi
	movq	%rax, %rdi
	call	_Z13printSolutionPii
	.loc 1 72 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z8dijkstraPA9_ii, .-_Z8dijkstraPA9_ii
	.section	.rodata
	.align 32
.LC0:
	.long	0
	.long	4
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	8
	.long	0
	.long	4
	.long	0
	.long	8
	.long	0
	.long	0
	.long	0
	.long	0
	.long	11
	.long	0
	.long	0
	.long	8
	.long	0
	.long	7
	.long	0
	.long	4
	.long	0
	.long	0
	.long	2
	.long	0
	.long	0
	.long	7
	.long	0
	.long	9
	.long	14
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	9
	.long	0
	.long	10
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	4
	.long	14
	.long	10
	.long	0
	.long	2
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	2
	.long	0
	.long	1
	.long	6
	.long	8
	.long	11
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1
	.long	0
	.long	7
	.long	0
	.long	0
	.long	2
	.long	0
	.long	0
	.long	0
	.long	6
	.long	7
	.long	0
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 1 76 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$336, %rsp
	.loc 1 87 0
	leaq	-336(%rbp), %rdx
	leaq	.LC0(%rip), %rax
	movl	$40, %ecx
	movq	%rdx, %rdi
	movq	%rax, %rsi
	rep movsq
	movq	%rsi, %rax
	movq	%rdi, %rdx
	movl	(%rax), %ecx
	movl	%ecx, (%rdx)
	leaq	4(%rdx), %rdx
	leaq	4(%rax), %rax
	.loc 1 89 0
	leaq	-336(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	_Z8dijkstraPA9_ii
	.loc 1 91 0
	movl	$0, %eax
	.loc 1 92 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/6/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/libio.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x543
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF67
	.byte	0x4
	.long	.LASF68
	.long	.LASF69
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd8
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x84
	.long	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x7
	.long	0x95
	.uleb128 0x8
	.long	.LASF41
	.byte	0xd8
	.byte	0x4
	.byte	0xf1
	.long	0x21e
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0xf2
	.long	0x62
	.byte	0
	.uleb128 0x9
	.long	.LASF13
	.byte	0x4
	.byte	0xf7
	.long	0x8f
	.byte	0x8
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0xf8
	.long	0x8f
	.byte	0x10
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0xf9
	.long	0x8f
	.byte	0x18
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0xfa
	.long	0x8f
	.byte	0x20
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0xfb
	.long	0x8f
	.byte	0x28
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0xfc
	.long	0x8f
	.byte	0x30
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.byte	0xfd
	.long	0x8f
	.byte	0x38
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.byte	0xfe
	.long	0x8f
	.byte	0x40
	.uleb128 0xa
	.long	.LASF21
	.byte	0x4
	.value	0x100
	.long	0x8f
	.byte	0x48
	.uleb128 0xa
	.long	.LASF22
	.byte	0x4
	.value	0x101
	.long	0x8f
	.byte	0x50
	.uleb128 0xa
	.long	.LASF23
	.byte	0x4
	.value	0x102
	.long	0x8f
	.byte	0x58
	.uleb128 0xa
	.long	.LASF24
	.byte	0x4
	.value	0x104
	.long	0x256
	.byte	0x60
	.uleb128 0xa
	.long	.LASF25
	.byte	0x4
	.value	0x106
	.long	0x25c
	.byte	0x68
	.uleb128 0xa
	.long	.LASF26
	.byte	0x4
	.value	0x108
	.long	0x62
	.byte	0x70
	.uleb128 0xa
	.long	.LASF27
	.byte	0x4
	.value	0x10c
	.long	0x62
	.byte	0x74
	.uleb128 0xa
	.long	.LASF28
	.byte	0x4
	.value	0x10e
	.long	0x70
	.byte	0x78
	.uleb128 0xa
	.long	.LASF29
	.byte	0x4
	.value	0x112
	.long	0x46
	.byte	0x80
	.uleb128 0xa
	.long	.LASF30
	.byte	0x4
	.value	0x113
	.long	0x54
	.byte	0x82
	.uleb128 0xa
	.long	.LASF31
	.byte	0x4
	.value	0x114
	.long	0x262
	.byte	0x83
	.uleb128 0xa
	.long	.LASF32
	.byte	0x4
	.value	0x118
	.long	0x272
	.byte	0x88
	.uleb128 0xa
	.long	.LASF33
	.byte	0x4
	.value	0x121
	.long	0x7b
	.byte	0x90
	.uleb128 0xa
	.long	.LASF34
	.byte	0x4
	.value	0x129
	.long	0x8d
	.byte	0x98
	.uleb128 0xa
	.long	.LASF35
	.byte	0x4
	.value	0x12a
	.long	0x8d
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.value	0x12b
	.long	0x8d
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.value	0x12c
	.long	0x8d
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.value	0x12e
	.long	0x2d
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF39
	.byte	0x4
	.value	0x12f
	.long	0x62
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF40
	.byte	0x4
	.value	0x131
	.long	0x278
	.byte	0xc4
	.byte	0
	.uleb128 0xb
	.long	.LASF70
	.byte	0x4
	.byte	0x96
	.uleb128 0x8
	.long	.LASF42
	.byte	0x18
	.byte	0x4
	.byte	0x9c
	.long	0x256
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.byte	0x9d
	.long	0x256
	.byte	0
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4
	.byte	0x9e
	.long	0x25c
	.byte	0x8
	.uleb128 0x9
	.long	.LASF45
	.byte	0x4
	.byte	0xa2
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x225
	.uleb128 0x6
	.byte	0x8
	.long	0xa1
	.uleb128 0xc
	.long	0x95
	.long	0x272
	.uleb128 0xd
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x21e
	.uleb128 0xc
	.long	0x95
	.long	0x288
	.uleb128 0xd
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF71
	.uleb128 0xf
	.long	.LASF46
	.byte	0x4
	.value	0x13b
	.long	0x288
	.uleb128 0xf
	.long	.LASF47
	.byte	0x4
	.value	0x13c
	.long	0x288
	.uleb128 0xf
	.long	.LASF48
	.byte	0x4
	.value	0x13d
	.long	0x288
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0x7
	.long	0x2b1
	.uleb128 0x10
	.long	.LASF49
	.byte	0x5
	.byte	0xaa
	.long	0x25c
	.uleb128 0x10
	.long	.LASF50
	.byte	0x5
	.byte	0xab
	.long	0x25c
	.uleb128 0x10
	.long	.LASF51
	.byte	0x5
	.byte	0xac
	.long	0x25c
	.uleb128 0x10
	.long	.LASF52
	.byte	0x6
	.byte	0x1a
	.long	0x62
	.uleb128 0xc
	.long	0x2b7
	.long	0x2f3
	.uleb128 0x11
	.byte	0
	.uleb128 0x10
	.long	.LASF53
	.byte	0x6
	.byte	0x1b
	.long	0x2e8
	.uleb128 0x10
	.long	.LASF54
	.byte	0x6
	.byte	0x1e
	.long	0x62
	.uleb128 0x10
	.long	.LASF55
	.byte	0x6
	.byte	0x1f
	.long	0x2e8
	.uleb128 0x12
	.long	.LASF56
	.byte	0x1
	.byte	0x4b
	.long	0x62
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x345
	.uleb128 0x13
	.long	.LASF58
	.byte	0x1
	.byte	0x4e
	.long	0x345
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.byte	0
	.uleb128 0xc
	.long	0x62
	.long	0x35b
	.uleb128 0xd
	.long	0x86
	.byte	0x8
	.uleb128 0xd
	.long	0x86
	.byte	0x8
	.byte	0
	.uleb128 0x14
	.long	.LASF57
	.byte	0x1
	.byte	0x22
	.long	.LASF64
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x437
	.uleb128 0x15
	.long	.LASF58
	.byte	0x1
	.byte	0x22
	.long	0x447
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x16
	.string	"src"
	.byte	0x1
	.byte	0x22
	.long	0x62
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x13
	.long	.LASF59
	.byte	0x1
	.byte	0x24
	.long	0x437
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x13
	.long	.LASF60
	.byte	0x1
	.byte	0x27
	.long	0x44d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -89
	.uleb128 0x17
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x3da
	.uleb128 0x18
	.string	"i"
	.byte	0x1
	.byte	0x2b
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x13
	.long	.LASF61
	.byte	0x1
	.byte	0x32
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x18
	.string	"u"
	.byte	0x1
	.byte	0x36
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x18
	.string	"v"
	.byte	0x1
	.byte	0x3c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x62
	.long	0x447
	.uleb128 0xd
	.long	0x86
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x437
	.uleb128 0xc
	.long	0x45d
	.long	0x45d
	.uleb128 0xd
	.long	0x86
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF62
	.uleb128 0x14
	.long	.LASF63
	.byte	0x1
	.byte	0x19
	.long	.LASF65
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x4be
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x19
	.long	0x4be
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.string	"n"
	.byte	0x1
	.byte	0x19
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x19
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x18
	.string	"i"
	.byte	0x1
	.byte	0x1c
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x62
	.uleb128 0x1a
	.long	.LASF72
	.byte	0x1
	.byte	0xc
	.long	.LASF73
	.long	0x62
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x540
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0xc
	.long	0x4be
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.long	.LASF60
	.byte	0x1
	.byte	0xc
	.long	0x540
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x18
	.string	"min"
	.byte	0x1
	.byte	0xf
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.long	.LASF66
	.byte	0x1
	.byte	0xf
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x18
	.string	"v"
	.byte	0x1
	.byte	0x11
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x45d
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF20:
	.string	"_IO_buf_end"
.LASF28:
	.string	"_old_offset"
.LASF64:
	.string	"_Z8dijkstraPA9_ii"
.LASF59:
	.string	"dist"
.LASF52:
	.string	"sys_nerr"
.LASF23:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF10:
	.string	"sizetype"
.LASF33:
	.string	"_offset"
.LASF17:
	.string	"_IO_write_ptr"
.LASF12:
	.string	"_flags"
.LASF73:
	.string	"_Z11minDistancePiPb"
.LASF19:
	.string	"_IO_buf_base"
.LASF24:
	.string	"_markers"
.LASF14:
	.string	"_IO_read_end"
.LASF62:
	.string	"bool"
.LASF55:
	.string	"_sys_errlist"
.LASF51:
	.string	"stderr"
.LASF63:
	.string	"printSolution"
.LASF32:
	.string	"_lock"
.LASF6:
	.string	"long int"
.LASF29:
	.string	"_cur_column"
.LASF48:
	.string	"_IO_2_1_stderr_"
.LASF71:
	.string	"_IO_FILE_plus"
.LASF45:
	.string	"_pos"
.LASF54:
	.string	"_sys_nerr"
.LASF60:
	.string	"sptSet"
.LASF44:
	.string	"_sbuf"
.LASF41:
	.string	"_IO_FILE"
.LASF1:
	.string	"unsigned char"
.LASF57:
	.string	"dijkstra"
.LASF46:
	.string	"_IO_2_1_stdin_"
.LASF4:
	.string	"signed char"
.LASF67:
	.string	"GNU C++14 6.3.0 20170516 -mtune=generic -march=x86-64 -g"
.LASF3:
	.string	"unsigned int"
.LASF42:
	.string	"_IO_marker"
.LASF31:
	.string	"_shortbuf"
.LASF16:
	.string	"_IO_write_base"
.LASF36:
	.string	"__pad3"
.LASF13:
	.string	"_IO_read_ptr"
.LASF2:
	.string	"short unsigned int"
.LASF11:
	.string	"char"
.LASF56:
	.string	"main"
.LASF43:
	.string	"_next"
.LASF34:
	.string	"__pad1"
.LASF35:
	.string	"__pad2"
.LASF69:
	.string	"/home/ericksun/programming/algrithm/dijkstra"
.LASF37:
	.string	"__pad4"
.LASF38:
	.string	"__pad5"
.LASF72:
	.string	"minDistance"
.LASF0:
	.string	"long unsigned int"
.LASF18:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
.LASF8:
	.string	"__off_t"
.LASF58:
	.string	"graph"
.LASF25:
	.string	"_chain"
.LASF61:
	.string	"count"
.LASF22:
	.string	"_IO_backup_base"
.LASF49:
	.string	"stdin"
.LASF66:
	.string	"min_index"
.LASF27:
	.string	"_flags2"
.LASF39:
	.string	"_mode"
.LASF15:
	.string	"_IO_read_base"
.LASF65:
	.string	"_Z13printSolutionPii"
.LASF30:
	.string	"_vtable_offset"
.LASF40:
	.string	"_unused2"
.LASF21:
	.string	"_IO_save_base"
.LASF53:
	.string	"sys_errlist"
.LASF26:
	.string	"_fileno"
.LASF68:
	.string	"main.cpp"
.LASF50:
	.string	"stdout"
.LASF47:
	.string	"_IO_2_1_stdout_"
.LASF70:
	.string	"_IO_lock_t"
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",@progbits
