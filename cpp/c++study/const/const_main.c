




// c中一样core dump
int non_const_c = 666666;
int *non_const_bp;
const int const_a = 555555;
int main () 
{
	non_const_bp = (int*)(&const_a);
	*non_const_bp = 11111;

	return 0;
}
