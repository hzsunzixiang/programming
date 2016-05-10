

# -O1 选项  64位的情况
simple_l:
.LFB0:
	.cfi_startproc
	movq	%rsi, %rax
	addq	(%rdi), %rax
	movq	%rax, (%rdi)
	ret


(gdb) disassemble main
Dump of assembler code for function main:
   0x00000000004004ac <+0>:     sub    $0x10,%rsp
   0x00000000004004b0 <+4>:     movq   $0x111,0x8(%rsp)
   0x00000000004004b9 <+13>:    mov    $0x222,%esi
   0x00000000004004be <+18>:    lea    0x8(%rsp),%rdi
   0x00000000004004c3 <+23>:    callq  0x4004a2 <simple_l>
   0x00000000004004c8 <+28>:    mov    $0x0,%eax
   0x00000000004004cd <+33>:    add    $0x10,%rsp
   0x00000000004004d1 <+37>:    retq
End of assembler dump.


(gdb) info registers rsi rax rdi
rsi            0x7fffffffe678   140737488348792
rax            0x4004ac 4195500
rdi            0x1      1
(gdb) si
16              simple_l(xp, y);
(gdb) info registers rsi rax rdi
rsi            0x7fffffffe678   140737488348792
rax            0x4004ac 4195500
rdi            0x1      1
(gdb) si
0x00000000004004be      16              simple_l(xp, y);
(gdb) info registers rsi rax rdi
rsi            0x222    546
rax            0x4004ac 4195500
rdi            0x1      1
(gdb) disassemble main
Dump of assembler code for function main:
   0x00000000004004ac <+0>:     sub    $0x10,%rsp
   0x00000000004004b0 <+4>:     movq   $0x111,0x8(%rsp)
   0x00000000004004b9 <+13>:    mov    $0x222,%esi
=> 0x00000000004004be <+18>:    lea    0x8(%rsp),%rdi
   0x00000000004004c3 <+23>:    callq  0x4004a2 <simple_l>
   0x00000000004004c8 <+28>:    mov    $0x0,%eax
   0x00000000004004cd <+33>:    add    $0x10,%rsp
   0x00000000004004d1 <+37>:    retq
End of assembler dump.
(gdb) si
0x00000000004004c3      16              simple_l(xp, y);
(gdb) info registers rsi rax rdi
rsi            0x222    546
rax            0x4004ac 4195500
rdi            0x7fffffffe590   140737488348560
(gdb) p/x $rsp
$2 = 0x7fffffffe588

(gdb) p/x $rsp
$2 = 0x7fffffffe588
(gdb) info registers rsi rax rdi
rsi            0x222    546
rax            0x4004ac 4195500
rdi            0x7fffffffe590   140737488348560
(gdb) p/x *$rdi
$3 = 0x111


