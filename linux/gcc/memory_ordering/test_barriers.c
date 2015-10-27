int A, B;
void test() {
	A = B + 1;
	asm volatile("" ::: "memory");
	B = 0;
}
