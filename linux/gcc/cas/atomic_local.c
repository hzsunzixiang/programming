

void test_func_nonatom()
{
	int count = 100;
	count += 1;
}
void test_func_atomic()
{
	int count = 200;
	__sync_fetch_and_add(&count, 1);
}
