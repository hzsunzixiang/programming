	.file	"Point3d_static.cpp"
	.text
.Ltext0:
	.section	.text._ZNKSt9type_info4nameEv,"axG",@progbits,_ZNKSt9type_info4nameEv,comdat
	.align 2
	.weak	_ZNKSt9type_info4nameEv
	.type	_ZNKSt9type_info4nameEv, @function
_ZNKSt9type_info4nameEv:
.LFB92:
	.file 1 "/usr/include/c++/4.9/typeinfo"
	.loc 1 99 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 100 0
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$42, %al
	jne	.L2
	.loc 1 100 0 is_stmt 0 discriminator 1
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	addq	$1, %rax
	jmp	.L3
.L2:
	.loc 1 100 0 discriminator 2
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
.L3:
	.loc 1 100 0 discriminator 4
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE92:
	.size	_ZNKSt9type_info4nameEv, .-_ZNKSt9type_info4nameEv
	.section	.text._ZN7Point3d3funEi,"axG",@progbits,_ZN7Point3d3funEi,comdat
	.weak	_ZN7Point3d3funEi
	.type	_ZN7Point3d3funEi, @function
_ZN7Point3d3funEi:
.LFB105:
	.file 2 "Point3d_static.cpp"
	.loc 2 13 0 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	.loc 2 13 0
	movl	-4(%rbp), %eax
	addl	$10, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE105:
	.size	_ZN7Point3d3funEi, .-_ZN7Point3d3funEi
	.section	.text._ZN7Point3d3barEi,"axG",@progbits,_ZN7Point3d3barEi,comdat
	.align 2
	.weak	_ZN7Point3d3barEi
	.type	_ZN7Point3d3barEi, @function
_ZN7Point3d3barEi:
.LFB106:
	.loc 2 14 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	.loc 2 14 0
	movl	-12(%rbp), %eax
	addl	$10, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE106:
	.size	_ZN7Point3d3barEi, .-_ZN7Point3d3barEi
	.text
	.align 2
	.globl	_ZNK7Point3d9magnitudeEv
	.type	_ZNK7Point3d9magnitudeEv, @function
_ZNK7Point3d9magnitudeEv:
.LFB107:
	.loc 2 47 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 2 48 0
	movq	-8(%rbp), %rax
	movsd	8(%rax), %xmm1
	movq	-8(%rbp), %rax
	movsd	8(%rax), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-8(%rbp), %rax
	movsd	16(%rax), %xmm2
	movq	-8(%rbp), %rax
	movsd	16(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm2
	movq	-8(%rbp), %rax
	movsd	24(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	call	sqrt
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	.loc 2 49 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE107:
	.size	_ZNK7Point3d9magnitudeEv, .-_ZNK7Point3d9magnitudeEv
	.section	.text._ZN7Point3dC2Ev,"axG",@progbits,_ZN7Point3dC5Ev,comdat
	.align 2
	.weak	_ZN7Point3dC2Ev
	.type	_ZN7Point3dC2Ev, @function
_ZN7Point3dC2Ev:
.LFB110:
	.loc 2 5 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
.LBB2:
	.loc 2 5 0
	movq	-8(%rbp), %rax
	movq	$_ZTV7Point3d+16, (%rax)
.LBE2:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE110:
	.size	_ZN7Point3dC2Ev, .-_ZN7Point3dC2Ev
	.weak	_ZN7Point3dC1Ev
	.set	_ZN7Point3dC1Ev,_ZN7Point3dC2Ev
	.text
	.align 2
	.globl	_ZN7Point3d9normalizeEv
	.type	_ZN7Point3d9normalizeEv, @function
_ZN7Point3d9normalizeEv:
.LFB108:
	.loc 2 54 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
.LBB3:
	.loc 2 55 0
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, %rdi
	call	*%rax
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	.loc 2 56 0
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7Point3dC1Ev
	.loc 2 57 0
	movq	-32(%rbp), %rax
	movsd	8(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 8(%rdx)
	.loc 2 58 0
	movq	-32(%rbp), %rax
	movsd	16(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 16(%rdx)
	.loc 2 59 0
	movq	-32(%rbp), %rax
	movsd	24(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 24(%rdx)
	.loc 2 60 0
	nop
.LBE3:
	.loc 2 61 0
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE108:
	.size	_ZN7Point3d9normalizeEv, .-_ZN7Point3d9normalizeEv
	.section	.rodata
.LC0:
	.string	"&fun: %p\n"
.LC1:
	.string	"&bar: %p\n"
.LC2:
	.string	"typeid fun: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB115:
	.loc 2 65 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
.LBB4:
	.loc 2 66 0
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7Point3dC1Ev
	.loc 2 67 0
	leaq	-80(%rbp), %rax
	movq	%rax, -40(%rbp)
	.loc 2 68 0
	movq	$0, -48(%rbp)
	.loc 2 72 0
	leaq	-112(%rbp), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN7Point3d9normalizeEv
	.loc 2 77 0
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-112(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	call	*%rax
	.loc 2 82 0
	movl	$1, %edi
	call	_ZN7Point3d3funEi
	.loc 2 83 0
	movl	$1, %edi
	call	_ZN7Point3d3funEi
	.loc 2 84 0
	movl	$1, %edi
	call	_ZN7Point3d3funEi
	.loc 2 86 0
	movl	$_ZN7Point3d3funEi, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	.loc 2 87 0
	movl	$_ZN7Point3d3barEi, %r12d
	movl	$0, %r13d
	movq	%r12, %rcx
	movq	%r13, %rbx
	movq	%r12, %rax
	movq	%r13, %rdx
	movq	%rdx, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdx
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	.loc 2 88 0
	movl	$_ZTIFiiE, %edi
	call	_ZNKSt9type_info4nameEv
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	.loc 2 91 0
	movl	$0, %eax
.LBE4:
	.loc 2 92 0
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE115:
	.size	main, .-main
	.weak	_ZTV7Point3d
	.section	.rodata._ZTV7Point3d,"aG",@progbits,_ZTV7Point3d,comdat
	.align 32
	.type	_ZTV7Point3d, @object
	.size	_ZTV7Point3d, 32
_ZTV7Point3d:
	.quad	0
	.quad	_ZTI7Point3d
	.quad	_ZNK7Point3d9magnitudeEv
	.quad	_ZN7Point3d9normalizeEv
	.weak	_ZTSFiiE
	.section	.rodata._ZTSFiiE,"aG",@progbits,_ZTSFiiE,comdat
	.type	_ZTSFiiE, @object
	.size	_ZTSFiiE, 5
_ZTSFiiE:
	.string	"FiiE"
	.weak	_ZTIFiiE
	.section	.rodata._ZTIFiiE,"aG",@progbits,_ZTIFiiE,comdat
	.align 16
	.type	_ZTIFiiE, @object
	.size	_ZTIFiiE, 16
_ZTIFiiE:
	.quad	_ZTVN10__cxxabiv120__function_type_infoE+16
	.quad	_ZTSFiiE
	.weak	_ZTI7Point3d
	.section	.rodata._ZTI7Point3d,"aG",@progbits,_ZTI7Point3d,comdat
	.align 16
	.type	_ZTI7Point3d, @object
	.size	_ZTI7Point3d, 16
_ZTI7Point3d:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTS7Point3d
	.weak	_ZTS7Point3d
	.section	.rodata._ZTS7Point3d,"aG",@progbits,_ZTS7Point3d,comdat
	.type	_ZTS7Point3d, @object
	.size	_ZTS7Point3d, 9
_ZTS7Point3d:
	.string	"7Point3d"
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/4.9/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/libio.h"
	.file 7 "/usr/include/wchar.h"
	.file 8 "/usr/include/_G_config.h"
	.file 9 "/usr/include/c++/4.9/cstdio"
	.file 10 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9bf
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF102
	.byte	0x4
	.long	.LASF103
	.long	.LASF104
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0xd4
	.long	0x34
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
	.byte	0x4
	.byte	0x83
	.long	0x65
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x84
	.long	0x65
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x91
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x5
	.byte	0x30
	.long	0xa3
	.uleb128 0x7
	.long	.LASF52
	.byte	0xd8
	.byte	0x6
	.byte	0xf5
	.long	0x223
	.uleb128 0x8
	.long	.LASF13
	.byte	0x6
	.byte	0xf6
	.long	0x5e
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x6
	.byte	0xfb
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x6
	.byte	0xfc
	.long	0x8b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x6
	.byte	0xfd
	.long	0x8b
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x6
	.byte	0xfe
	.long	0x8b
	.byte	0x20
	.uleb128 0x8
	.long	.LASF18
	.byte	0x6
	.byte	0xff
	.long	0x8b
	.byte	0x28
	.uleb128 0x9
	.long	.LASF19
	.byte	0x6
	.value	0x100
	.long	0x8b
	.byte	0x30
	.uleb128 0x9
	.long	.LASF20
	.byte	0x6
	.value	0x101
	.long	0x8b
	.byte	0x38
	.uleb128 0x9
	.long	.LASF21
	.byte	0x6
	.value	0x102
	.long	0x8b
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6
	.value	0x104
	.long	0x8b
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x6
	.value	0x105
	.long	0x8b
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x6
	.value	0x106
	.long	0x8b
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x6
	.value	0x108
	.long	0x2ea
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x6
	.value	0x10a
	.long	0x2f0
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x6
	.value	0x10c
	.long	0x5e
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x6
	.value	0x110
	.long	0x5e
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x6
	.value	0x112
	.long	0x6c
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x6
	.value	0x116
	.long	0x42
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x6
	.value	0x117
	.long	0x50
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x6
	.value	0x118
	.long	0x2f6
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x6
	.value	0x11c
	.long	0x306
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x6
	.value	0x125
	.long	0x77
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x6
	.value	0x12e
	.long	0x89
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x6
	.value	0x12f
	.long	0x89
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x6
	.value	0x130
	.long	0x89
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x6
	.value	0x131
	.long	0x89
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x6
	.value	0x132
	.long	0x29
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x6
	.value	0x134
	.long	0x5e
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x6
	.value	0x136
	.long	0x30c
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.byte	0x7
	.byte	0x53
	.long	.LASF47
	.long	0x267
	.uleb128 0xb
	.byte	0x4
	.byte	0x7
	.byte	0x56
	.long	0x24e
	.uleb128 0xc
	.long	.LASF42
	.byte	0x7
	.byte	0x58
	.long	0x49
	.uleb128 0xc
	.long	.LASF43
	.byte	0x7
	.byte	0x5c
	.long	0x267
	.byte	0
	.uleb128 0x8
	.long	.LASF44
	.byte	0x7
	.byte	0x54
	.long	0x5e
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x7
	.byte	0x5d
	.long	0x22f
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.long	0x91
	.long	0x277
	.uleb128 0xe
	.long	0x82
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF46
	.byte	0x7
	.byte	0x5e
	.long	0x223
	.uleb128 0xa
	.byte	0x10
	.byte	0x8
	.byte	0x16
	.long	.LASF48
	.long	0x2a7
	.uleb128 0x8
	.long	.LASF49
	.byte	0x8
	.byte	0x17
	.long	0x6c
	.byte	0
	.uleb128 0x8
	.long	.LASF50
	.byte	0x8
	.byte	0x18
	.long	0x277
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF51
	.byte	0x8
	.byte	0x19
	.long	0x282
	.uleb128 0xf
	.long	.LASF105
	.byte	0x6
	.byte	0x9a
	.uleb128 0x7
	.long	.LASF53
	.byte	0x18
	.byte	0x6
	.byte	0xa0
	.long	0x2ea
	.uleb128 0x8
	.long	.LASF54
	.byte	0x6
	.byte	0xa1
	.long	0x2ea
	.byte	0
	.uleb128 0x8
	.long	.LASF55
	.byte	0x6
	.byte	0xa2
	.long	0x2f0
	.byte	0x8
	.uleb128 0x8
	.long	.LASF56
	.byte	0x6
	.byte	0xa6
	.long	0x5e
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2b9
	.uleb128 0x6
	.byte	0x8
	.long	0xa3
	.uleb128 0xd
	.long	0x91
	.long	0x306
	.uleb128 0xe
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2b2
	.uleb128 0xd
	.long	0x91
	.long	0x31c
	.uleb128 0xe
	.long	0x82
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x322
	.uleb128 0x10
	.long	0x91
	.uleb128 0x2
	.long	.LASF57
	.byte	0x5
	.byte	0x6e
	.long	0x2a7
	.uleb128 0x11
	.string	"std"
	.byte	0xa
	.byte	0
	.long	0x42b
	.uleb128 0x12
	.byte	0x9
	.byte	0x62
	.long	0x98
	.uleb128 0x12
	.byte	0x9
	.byte	0x63
	.long	0x327
	.uleb128 0x12
	.byte	0x9
	.byte	0x65
	.long	0x42b
	.uleb128 0x12
	.byte	0x9
	.byte	0x66
	.long	0x443
	.uleb128 0x12
	.byte	0x9
	.byte	0x67
	.long	0x458
	.uleb128 0x12
	.byte	0x9
	.byte	0x68
	.long	0x46e
	.uleb128 0x12
	.byte	0x9
	.byte	0x69
	.long	0x484
	.uleb128 0x12
	.byte	0x9
	.byte	0x6a
	.long	0x499
	.uleb128 0x12
	.byte	0x9
	.byte	0x6b
	.long	0x4af
	.uleb128 0x12
	.byte	0x9
	.byte	0x6c
	.long	0x4d0
	.uleb128 0x12
	.byte	0x9
	.byte	0x6d
	.long	0x4f0
	.uleb128 0x12
	.byte	0x9
	.byte	0x71
	.long	0x50b
	.uleb128 0x12
	.byte	0x9
	.byte	0x72
	.long	0x530
	.uleb128 0x12
	.byte	0x9
	.byte	0x74
	.long	0x550
	.uleb128 0x12
	.byte	0x9
	.byte	0x75
	.long	0x570
	.uleb128 0x12
	.byte	0x9
	.byte	0x76
	.long	0x596
	.uleb128 0x12
	.byte	0x9
	.byte	0x78
	.long	0x5ac
	.uleb128 0x12
	.byte	0x9
	.byte	0x79
	.long	0x5c2
	.uleb128 0x12
	.byte	0x9
	.byte	0x7c
	.long	0x5ce
	.uleb128 0x12
	.byte	0x9
	.byte	0x7e
	.long	0x5e4
	.uleb128 0x12
	.byte	0x9
	.byte	0x83
	.long	0x5f6
	.uleb128 0x12
	.byte	0x9
	.byte	0x84
	.long	0x60b
	.uleb128 0x12
	.byte	0x9
	.byte	0x85
	.long	0x625
	.uleb128 0x12
	.byte	0x9
	.byte	0x87
	.long	0x637
	.uleb128 0x12
	.byte	0x9
	.byte	0x88
	.long	0x64e
	.uleb128 0x12
	.byte	0x9
	.byte	0x8b
	.long	0x673
	.uleb128 0x12
	.byte	0x9
	.byte	0x8d
	.long	0x67e
	.uleb128 0x12
	.byte	0x9
	.byte	0x8f
	.long	0x693
	.uleb128 0x13
	.long	.LASF106
	.long	0x425
	.uleb128 0x14
	.long	.LASF95
	.byte	0x1
	.byte	0x63
	.long	.LASF107
	.long	0x31c
	.byte	0x1
	.long	0x41e
	.uleb128 0x15
	.long	0x7f9
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	0x401
	.byte	0
	.uleb128 0x16
	.long	.LASF73
	.byte	0x5
	.value	0x33a
	.long	0x43d
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x98
	.uleb128 0x18
	.long	.LASF58
	.byte	0x5
	.byte	0xed
	.long	0x5e
	.long	0x458
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x19
	.long	.LASF59
	.byte	0x5
	.value	0x33c
	.long	0x5e
	.long	0x46e
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x19
	.long	.LASF60
	.byte	0x5
	.value	0x33e
	.long	0x5e
	.long	0x484
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x18
	.long	.LASF61
	.byte	0x5
	.byte	0xf2
	.long	0x5e
	.long	0x499
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x19
	.long	.LASF62
	.byte	0x5
	.value	0x213
	.long	0x5e
	.long	0x4af
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x19
	.long	.LASF63
	.byte	0x5
	.value	0x31e
	.long	0x5e
	.long	0x4ca
	.uleb128 0x17
	.long	0x43d
	.uleb128 0x17
	.long	0x4ca
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x327
	.uleb128 0x19
	.long	.LASF64
	.byte	0x5
	.value	0x26e
	.long	0x8b
	.long	0x4f0
	.uleb128 0x17
	.long	0x8b
	.uleb128 0x17
	.long	0x5e
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x19
	.long	.LASF65
	.byte	0x5
	.value	0x110
	.long	0x43d
	.long	0x50b
	.uleb128 0x17
	.long	0x31c
	.uleb128 0x17
	.long	0x31c
	.byte	0
	.uleb128 0x19
	.long	.LASF66
	.byte	0x5
	.value	0x2c5
	.long	0x29
	.long	0x530
	.uleb128 0x17
	.long	0x89
	.uleb128 0x17
	.long	0x29
	.uleb128 0x17
	.long	0x29
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x19
	.long	.LASF67
	.byte	0x5
	.value	0x116
	.long	0x43d
	.long	0x550
	.uleb128 0x17
	.long	0x31c
	.uleb128 0x17
	.long	0x31c
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x19
	.long	.LASF68
	.byte	0x5
	.value	0x2ed
	.long	0x5e
	.long	0x570
	.uleb128 0x17
	.long	0x43d
	.uleb128 0x17
	.long	0x65
	.uleb128 0x17
	.long	0x5e
	.byte	0
	.uleb128 0x19
	.long	.LASF69
	.byte	0x5
	.value	0x323
	.long	0x5e
	.long	0x58b
	.uleb128 0x17
	.long	0x43d
	.uleb128 0x17
	.long	0x58b
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x591
	.uleb128 0x10
	.long	0x327
	.uleb128 0x19
	.long	.LASF70
	.byte	0x5
	.value	0x2f2
	.long	0x65
	.long	0x5ac
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x19
	.long	.LASF71
	.byte	0x5
	.value	0x214
	.long	0x5e
	.long	0x5c2
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x1a
	.long	.LASF80
	.byte	0x5
	.value	0x21a
	.long	0x5e
	.uleb128 0x19
	.long	.LASF72
	.byte	0x5
	.value	0x27e
	.long	0x8b
	.long	0x5e4
	.uleb128 0x17
	.long	0x8b
	.byte	0
	.uleb128 0x16
	.long	.LASF74
	.byte	0x5
	.value	0x34e
	.long	0x5f6
	.uleb128 0x17
	.long	0x31c
	.byte	0
	.uleb128 0x18
	.long	.LASF75
	.byte	0x5
	.byte	0xb2
	.long	0x5e
	.long	0x60b
	.uleb128 0x17
	.long	0x31c
	.byte	0
	.uleb128 0x18
	.long	.LASF76
	.byte	0x5
	.byte	0xb4
	.long	0x5e
	.long	0x625
	.uleb128 0x17
	.long	0x31c
	.uleb128 0x17
	.long	0x31c
	.byte	0
	.uleb128 0x16
	.long	.LASF77
	.byte	0x5
	.value	0x2f7
	.long	0x637
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x16
	.long	.LASF78
	.byte	0x5
	.value	0x14c
	.long	0x64e
	.uleb128 0x17
	.long	0x43d
	.uleb128 0x17
	.long	0x8b
	.byte	0
	.uleb128 0x19
	.long	.LASF79
	.byte	0x5
	.value	0x150
	.long	0x5e
	.long	0x673
	.uleb128 0x17
	.long	0x43d
	.uleb128 0x17
	.long	0x8b
	.uleb128 0x17
	.long	0x5e
	.uleb128 0x17
	.long	0x29
	.byte	0
	.uleb128 0x1b
	.long	.LASF81
	.byte	0x5
	.byte	0xc3
	.long	0x43d
	.uleb128 0x18
	.long	.LASF82
	.byte	0x5
	.byte	0xd1
	.long	0x8b
	.long	0x693
	.uleb128 0x17
	.long	0x8b
	.byte	0
	.uleb128 0x19
	.long	.LASF83
	.byte	0x5
	.value	0x2be
	.long	0x5e
	.long	0x6ae
	.uleb128 0x17
	.long	0x5e
	.uleb128 0x17
	.long	0x43d
	.byte	0
	.uleb128 0x1c
	.long	.LASF108
	.byte	0x9
	.byte	0x9e
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF84
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF85
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF86
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF87
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF88
	.uleb128 0x1d
	.long	.LASF90
	.byte	0x20
	.byte	0x2
	.byte	0x5
	.long	0x6d8
	.long	0x7c7
	.uleb128 0x1e
	.long	.LASF89
	.long	0x7d2
	.byte	0
	.byte	0x1
	.uleb128 0x1f
	.string	"_x"
	.byte	0x2
	.byte	0x27
	.long	0x6ca
	.byte	0x8
	.uleb128 0x1f
	.string	"_y"
	.byte	0x2
	.byte	0x28
	.long	0x6ca
	.byte	0x10
	.uleb128 0x1f
	.string	"_z"
	.byte	0x2
	.byte	0x29
	.long	0x6ca
	.byte	0x18
	.uleb128 0x20
	.long	.LASF90
	.byte	0x1
	.long	0x722
	.long	0x72d
	.uleb128 0x15
	.long	0x7e2
	.uleb128 0x17
	.long	0x7e8
	.byte	0
	.uleb128 0x20
	.long	.LASF90
	.byte	0x1
	.long	0x73b
	.long	0x741
	.uleb128 0x15
	.long	0x7e2
	.byte	0
	.uleb128 0x21
	.long	.LASF91
	.byte	0x2
	.byte	0x2e
	.long	.LASF93
	.long	0x6ca
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0
	.long	0x6d8
	.byte	0x1
	.long	0x761
	.long	0x767
	.uleb128 0x15
	.long	0x7f3
	.byte	0
	.uleb128 0x21
	.long	.LASF92
	.byte	0x2
	.byte	0x35
	.long	.LASF94
	.long	0x6d8
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0x1
	.long	0x6d8
	.byte	0x1
	.long	0x787
	.long	0x78d
	.uleb128 0x15
	.long	0x7e2
	.byte	0
	.uleb128 0x22
	.string	"fun"
	.byte	0x2
	.byte	0xd
	.long	.LASF96
	.long	0x5e
	.byte	0x1
	.long	0x7a7
	.uleb128 0x17
	.long	0x5e
	.byte	0
	.uleb128 0x23
	.string	"bar"
	.byte	0x2
	.byte	0xe
	.long	.LASF97
	.long	0x5e
	.byte	0x1
	.long	0x7bb
	.uleb128 0x15
	.long	0x7e2
	.uleb128 0x17
	.long	0x5e
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	0x5e
	.long	0x7d2
	.uleb128 0x25
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7d8
	.uleb128 0x26
	.byte	0x8
	.long	.LASF109
	.long	0x7c7
	.uleb128 0x6
	.byte	0x8
	.long	0x6d8
	.uleb128 0x27
	.byte	0x8
	.long	0x7ee
	.uleb128 0x10
	.long	0x6d8
	.uleb128 0x6
	.byte	0x8
	.long	0x7ee
	.uleb128 0x6
	.byte	0x8
	.long	0x425
	.uleb128 0x28
	.long	0x40a
	.quad	.LFB92
	.quad	.LFE92-.LFB92
	.uleb128 0x1
	.byte	0x9c
	.long	0x81e
	.long	0x82b
	.uleb128 0x29
	.long	.LASF98
	.long	0x82b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	0x7f9
	.uleb128 0x2a
	.long	0x78d
	.quad	.LFB105
	.quad	.LFE105-.LFB105
	.uleb128 0x1
	.byte	0x9c
	.long	0x858
	.uleb128 0x2b
	.string	"i"
	.byte	0x2
	.byte	0xd
	.long	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x28
	.long	0x7a7
	.quad	.LFB106
	.quad	.LFE106-.LFB106
	.uleb128 0x1
	.byte	0x9c
	.long	0x877
	.long	0x890
	.uleb128 0x29
	.long	.LASF98
	.long	0x890
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2b
	.string	"i"
	.byte	0x2
	.byte	0xe
	.long	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x10
	.long	0x7e2
	.uleb128 0x2c
	.long	0x741
	.quad	.LFB107
	.quad	.LFE107-.LFB107
	.uleb128 0x1
	.byte	0x9c
	.long	0x8b4
	.long	0x8c1
	.uleb128 0x29
	.long	.LASF98
	.long	0x8c1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	0x7f3
	.uleb128 0x2d
	.long	0x72d
	.byte	0x2
	.byte	0x5
	.byte	0x2
	.long	0x8d6
	.long	0x8e0
	.uleb128 0x2e
	.long	.LASF98
	.long	0x890
	.byte	0
	.uleb128 0x2f
	.long	0x8c6
	.long	.LASF110
	.quad	.LFB110
	.quad	.LFE110-.LFB110
	.uleb128 0x1
	.byte	0x9c
	.long	0x903
	.long	0x90c
	.uleb128 0x30
	.long	0x8d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2c
	.long	0x767
	.quad	.LFB108
	.quad	.LFE108-.LFB108
	.uleb128 0x1
	.byte	0x9c
	.long	0x92b
	.long	0x967
	.uleb128 0x29
	.long	.LASF98
	.long	0x890
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x31
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x32
	.string	"mag"
	.byte	0x2
	.byte	0x37
	.long	0x6ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x33
	.long	.LASF99
	.byte	0x2
	.byte	0x38
	.long	0x6d8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x34
	.long	.LASF100
	.byte	0x2
	.byte	0x40
	.long	0x5e
	.quad	.LFB115
	.quad	.LFE115-.LFB115
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x31
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x32
	.string	"obj"
	.byte	0x2
	.byte	0x42
	.long	0x6d8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x32
	.string	"ptr"
	.byte	0x2
	.byte	0x43
	.long	0x7e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x33
	.long	.LASF101
	.byte	0x2
	.byte	0x44
	.long	0x7e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.byte	0
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x17
	.byte	0x1
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
	.uleb128 0xc
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
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x4c
	.uleb128 0xb
	.uleb128 0x4d
	.uleb128 0x18
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
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
	.uleb128 0x2b
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
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x6c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB92
	.quad	.LFE92-.LFB92
	.quad	.LFB105
	.quad	.LFE105-.LFB105
	.quad	.LFB106
	.quad	.LFE106-.LFB106
	.quad	.LFB110
	.quad	.LFE110-.LFB110
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB92
	.quad	.LFE92
	.quad	.LFB105
	.quad	.LFE105
	.quad	.LFB106
	.quad	.LFE106
	.quad	.LFB110
	.quad	.LFE110
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"__off_t"
.LASF14:
	.string	"_IO_read_ptr"
.LASF26:
	.string	"_chain"
.LASF103:
	.string	"Point3d_static.cpp"
.LASF7:
	.string	"size_t"
.LASF32:
	.string	"_shortbuf"
.LASF51:
	.string	"_G_fpos_t"
.LASF20:
	.string	"_IO_buf_base"
.LASF84:
	.string	"long long unsigned int"
.LASF75:
	.string	"remove"
.LASF46:
	.string	"__mbstate_t"
.LASF68:
	.string	"fseek"
.LASF85:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF27:
	.string	"_fileno"
.LASF15:
	.string	"_IO_read_end"
.LASF6:
	.string	"long int"
.LASF13:
	.string	"_flags"
.LASF21:
	.string	"_IO_buf_end"
.LASF30:
	.string	"_cur_column"
.LASF87:
	.string	"double"
.LASF82:
	.string	"tmpnam"
.LASF29:
	.string	"_old_offset"
.LASF34:
	.string	"_offset"
.LASF98:
	.string	"this"
.LASF76:
	.string	"rename"
.LASF104:
	.string	"/home/StephenSun/programming/cpp/insideObjectModel/semanticsFunction/member_function"
.LASF49:
	.string	"__pos"
.LASF107:
	.string	"_ZNKSt9type_info4nameEv"
.LASF53:
	.string	"_IO_marker"
.LASF109:
	.string	"__vtbl_ptr_type"
.LASF3:
	.string	"unsigned int"
.LASF43:
	.string	"__wchb"
.LASF71:
	.string	"getc"
.LASF0:
	.string	"long unsigned int"
.LASF60:
	.string	"ferror"
.LASF18:
	.string	"_IO_write_ptr"
.LASF72:
	.string	"gets"
.LASF95:
	.string	"name"
.LASF55:
	.string	"_sbuf"
.LASF2:
	.string	"short unsigned int"
.LASF81:
	.string	"tmpfile"
.LASF22:
	.string	"_IO_save_base"
.LASF42:
	.string	"__wch"
.LASF62:
	.string	"fgetc"
.LASF67:
	.string	"freopen"
.LASF90:
	.string	"Point3d"
.LASF33:
	.string	"_lock"
.LASF28:
	.string	"_flags2"
.LASF40:
	.string	"_mode"
.LASF64:
	.string	"fgets"
.LASF97:
	.string	"_ZN7Point3d3barEi"
.LASF93:
	.string	"_ZNK7Point3d9magnitudeEv"
.LASF74:
	.string	"perror"
.LASF96:
	.string	"_ZN7Point3d3funEi"
.LASF10:
	.string	"sizetype"
.LASF86:
	.string	"long double"
.LASF110:
	.string	"_ZN7Point3dC2Ev"
.LASF73:
	.string	"clearerr"
.LASF19:
	.string	"_IO_write_end"
.LASF83:
	.string	"ungetc"
.LASF48:
	.string	"9_G_fpos_t"
.LASF105:
	.string	"_IO_lock_t"
.LASF52:
	.string	"_IO_FILE"
.LASF99:
	.string	"normal"
.LASF78:
	.string	"setbuf"
.LASF88:
	.string	"float"
.LASF65:
	.string	"fopen"
.LASF56:
	.string	"_pos"
.LASF61:
	.string	"fflush"
.LASF25:
	.string	"_markers"
.LASF50:
	.string	"__state"
.LASF1:
	.string	"unsigned char"
.LASF101:
	.string	"nullPtr"
.LASF5:
	.string	"short int"
.LASF92:
	.string	"normalize"
.LASF31:
	.string	"_vtable_offset"
.LASF12:
	.string	"FILE"
.LASF91:
	.string	"magnitude"
.LASF66:
	.string	"fread"
.LASF44:
	.string	"__count"
.LASF45:
	.string	"__value"
.LASF94:
	.string	"_ZN7Point3d9normalizeEv"
.LASF11:
	.string	"char"
.LASF57:
	.string	"fpos_t"
.LASF69:
	.string	"fsetpos"
.LASF59:
	.string	"feof"
.LASF106:
	.string	"type_info"
.LASF58:
	.string	"fclose"
.LASF54:
	.string	"_next"
.LASF9:
	.string	"__off64_t"
.LASF16:
	.string	"_IO_read_base"
.LASF24:
	.string	"_IO_save_end"
.LASF80:
	.string	"getchar"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF37:
	.string	"__pad3"
.LASF38:
	.string	"__pad4"
.LASF39:
	.string	"__pad5"
.LASF47:
	.string	"11__mbstate_t"
.LASF41:
	.string	"_unused2"
.LASF23:
	.string	"_IO_backup_base"
.LASF102:
	.string	"GNU C++ 4.9.2 -fpreprocessed -mtune=generic -march=x86-64 -g"
.LASF79:
	.string	"setvbuf"
.LASF77:
	.string	"rewind"
.LASF89:
	.string	"_vptr.Point3d"
.LASF70:
	.string	"ftell"
.LASF63:
	.string	"fgetpos"
.LASF100:
	.string	"main"
.LASF17:
	.string	"_IO_write_base"
.LASF108:
	.string	"__gnu_cxx"
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
