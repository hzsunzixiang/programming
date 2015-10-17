
int main()
{
	__asm__(
			"jmp forward\n\t"
			"backward:\n\t"
			"popl   %esi\n\t "     
			"movl   $4, %eax\n\t"
			"movl   $2, %ebx\n\t "
			"movl   %esi, %ecx\n\t"
			"movl   $12, %edx\n\t"
			"int    $0x80\n\t"
			"int3\n\t" 
			"forward:"
			"call   backward\n\t"
			".string \"Hello World\\n\"\n\t"
		   );
	return 0;
}
//# root@debian32-1:~/programming/linux/my_apue/ptrace# strace -e signal ./hello
//# Hello World
//# --- SIGTRAP {si_signo=SIGTRAP, si_code=SI_KERNEL, si_value={int=825111328, ptr=0x312e3320}} ---
//# +++ killed by SIGTRAP +++
//# Trace/breakpoint trap

