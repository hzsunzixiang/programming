	.file	"Point3d.cpp"
	.text
.Ltext0:
	.section	.text._ZN7Point3d3funEv,"axG",@progbits,_ZN7Point3d3funEv,comdat
	.align 2
	.weak	_ZN7Point3d3funEv
	.type	_ZN7Point3d3funEv, @function
_ZN7Point3d3funEv:
.LFB86:
	.file 1 "Point3d.cpp"
	.loc 1 12 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 12 0
	movl	$10, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE86:
	.size	_ZN7Point3d3funEv, .-_ZN7Point3d3funEv
	.text
	.align 2
	.globl	_ZNK7Point3d9magnitudeEv
	.type	_ZNK7Point3d9magnitudeEv, @function
_ZNK7Point3d9magnitudeEv:
.LFB87:
	.loc 1 22 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 23 0
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm1
	movq	-8(%rbp), %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm0, %xmm1
	movq	-8(%rbp), %rax
	movsd	8(%rax), %xmm2
	movq	-8(%rbp), %rax
	movsd	8(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm0, %xmm1
	movq	-8(%rbp), %rax
	movsd	16(%rax), %xmm2
	movq	-8(%rbp), %rax
	movsd	16(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	call	sqrt
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	.loc 1 24 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE87:
	.size	_ZNK7Point3d9magnitudeEv, .-_ZNK7Point3d9magnitudeEv
	.align 2
	.globl	_ZN7Point3d9normalizeEv
	.type	_ZN7Point3d9normalizeEv, @function
_ZN7Point3d9normalizeEv:
.LFB88:
	.loc 1 32 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
.LBB2:
	.loc 1 33 0
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNK7Point3d9magnitudeEv
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	.loc 1 35 0
	movq	-32(%rbp), %rax
	movsd	(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 36 0
	movq	-32(%rbp), %rax
	movsd	8(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 8(%rdx)
	.loc 1 37 0
	movq	-32(%rbp), %rax
	movsd	16(%rax), %xmm0
	divsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-24(%rbp), %rdx
	movq	%rax, 16(%rdx)
	.loc 1 38 0
	nop
.LBE2:
	.loc 1 39 0
	movq	-24(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE88:
	.size	_ZN7Point3d9normalizeEv, .-_ZN7Point3d9normalizeEv
	.globl	main
	.type	main, @function
main:
.LFB89:
	.loc 1 43 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
.LBB3:
	.loc 1 45 0
	leaq	-112(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 46 0
	movq	$0, -16(%rbp)
	.loc 1 48 0
	leaq	-80(%rbp), %rax
	leaq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN7Point3d9normalizeEv
	.loc 1 50 0
	leaq	-48(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN7Point3d9normalizeEv
	.loc 1 54 0
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN7Point3d3funEv
	.loc 1 59 0
	movl	$0, %eax
.LBE3:
	.loc 1 60 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE89:
	.size	main, .-main
.Letext0:
	.file 2 "<built-in>"
	.file 3 "/usr/include/c++/4.9/bits/cpp_type_traits.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x263
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.long	.LASF24
	.long	.LASF25
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.string	"std"
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF0
	.byte	0x3
	.byte	0x45
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.long	.LASF4
	.uleb128 0x4
	.byte	0x8
	.byte	0x7
	.long	.LASF5
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x4
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x4
	.byte	0x10
	.byte	0x4
	.long	.LASF10
	.uleb128 0x4
	.byte	0x8
	.byte	0x4
	.long	.LASF11
	.uleb128 0x4
	.byte	0x4
	.byte	0x4
	.long	.LASF12
	.uleb128 0x4
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x6
	.long	.LASF26
	.byte	0x18
	.byte	0x1
	.byte	0x4
	.long	0x13b
	.uleb128 0x7
	.string	"_x"
	.byte	0x1
	.byte	0xf
	.long	0x84
	.byte	0
	.uleb128 0x7
	.string	"_y"
	.byte	0x1
	.byte	0x10
	.long	0x84
	.byte	0x8
	.uleb128 0x7
	.string	"_z"
	.byte	0x1
	.byte	0x11
	.long	0x84
	.byte	0x10
	.uleb128 0x8
	.long	.LASF14
	.byte	0x1
	.byte	0x8
	.long	.LASF16
	.long	0x84
	.byte	0x1
	.long	0xde
	.long	0xe4
	.uleb128 0x9
	.long	0x13b
	.byte	0
	.uleb128 0x8
	.long	.LASF15
	.byte	0x1
	.byte	0x9
	.long	.LASF17
	.long	0x99
	.byte	0x1
	.long	0xfc
	.long	0x102
	.uleb128 0x9
	.long	0x13b
	.byte	0
	.uleb128 0x8
	.long	.LASF15
	.byte	0x1
	.byte	0xa
	.long	.LASF18
	.long	0x99
	.byte	0x1
	.long	0x11a
	.long	0x120
	.uleb128 0x9
	.long	0x146
	.byte	0
	.uleb128 0xa
	.string	"fun"
	.byte	0x1
	.byte	0xc
	.long	.LASF27
	.long	0x68
	.byte	0x1
	.long	0x134
	.uleb128 0x9
	.long	0x146
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.long	0x141
	.uleb128 0xc
	.long	0x99
	.uleb128 0xb
	.byte	0x8
	.long	0x99
	.uleb128 0xd
	.long	0x120
	.quad	.LFB86
	.quad	.LFE86-.LFB86
	.uleb128 0x1
	.byte	0x9c
	.long	0x16b
	.long	0x178
	.uleb128 0xe
	.long	.LASF19
	.long	0x178
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xc
	.long	0x146
	.uleb128 0xf
	.long	0xc6
	.byte	0x15
	.quad	.LFB87
	.quad	.LFE87-.LFB87
	.uleb128 0x1
	.byte	0x9c
	.long	0x19d
	.long	0x1aa
	.uleb128 0xe
	.long	.LASF19
	.long	0x1aa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xc
	.long	0x13b
	.uleb128 0xf
	.long	0x102
	.byte	0x1f
	.quad	.LFB88
	.quad	.LFE88-.LFB88
	.uleb128 0x1
	.byte	0x9c
	.long	0x1cf
	.long	0x20b
	.uleb128 0xe
	.long	.LASF19
	.long	0x178
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x10
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x11
	.string	"mag"
	.byte	0x1
	.byte	0x21
	.long	0x84
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.long	.LASF20
	.byte	0x1
	.byte	0x22
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	.LASF21
	.byte	0x1
	.byte	0x2a
	.long	0x68
	.quad	.LFB89
	.quad	.LFE89-.LFB89
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x11
	.string	"obj"
	.byte	0x1
	.byte	0x2c
	.long	0x99
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x11
	.string	"ptr"
	.byte	0x1
	.byte	0x2d
	.long	0x146
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.long	.LASF22
	.byte	0x1
	.byte	0x2e
	.long	0x146
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
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
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB86
	.quad	.LFE86-.LFB86
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB86
	.quad	.LFE86
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF23:
	.string	"GNU C++ 4.9.2 -fpreprocessed -mtune=generic -march=x86-64 -g"
.LASF26:
	.string	"Point3d"
.LASF7:
	.string	"short int"
.LASF15:
	.string	"normalize"
.LASF21:
	.string	"main"
.LASF12:
	.string	"float"
.LASF9:
	.string	"long long int"
.LASF8:
	.string	"long int"
.LASF22:
	.string	"nullPtr"
.LASF14:
	.string	"magnitude"
.LASF10:
	.string	"long double"
.LASF1:
	.string	"unsigned char"
.LASF0:
	.string	"__gnu_cxx"
.LASF6:
	.string	"signed char"
.LASF5:
	.string	"long long unsigned int"
.LASF24:
	.string	"Point3d.cpp"
.LASF16:
	.string	"_ZNK7Point3d9magnitudeEv"
.LASF2:
	.string	"short unsigned int"
.LASF13:
	.string	"char"
.LASF19:
	.string	"this"
.LASF20:
	.string	"normal"
.LASF4:
	.string	"long unsigned int"
.LASF11:
	.string	"double"
.LASF27:
	.string	"_ZN7Point3d3funEv"
.LASF17:
	.string	"_ZNK7Point3d9normalizeEv"
.LASF3:
	.string	"unsigned int"
.LASF18:
	.string	"_ZN7Point3d9normalizeEv"
.LASF25:
	.string	"/home/StephenSun/programming/cpp/insideObjectModel/semanticsFunction/member_function"
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
