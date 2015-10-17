
static int count = 0;

void test_func_nonatom()
{
	count += 1;
}
void test_func_atomic()
{
	__sync_fetch_and_add(&count, 1);
}
