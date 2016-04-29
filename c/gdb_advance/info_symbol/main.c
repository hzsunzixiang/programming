
int g_var = 100;
int g_bss;
static int i_var = 999;
char * s_var = "hello,world!";

void hello(char *s)
{
	char * s1 = s;
}
int main()
{
	int x;
	x = g_var + i_var;
	hello(s_var);
	return 0;
}
