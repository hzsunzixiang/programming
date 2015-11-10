
class ClassA

{

	public:

		int dataA;

	public:

		int  func_a(void){return dataA;}

};

int main()

{
	ClassA a;
	ClassA *p = &a;
	a.func_a();
	p->func_a();
	return 0;

}
