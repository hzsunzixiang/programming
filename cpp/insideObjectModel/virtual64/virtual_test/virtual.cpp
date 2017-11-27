class ClassA

{
	public:
		int dataA;

	public:

		virtual int  func_a(void){return dataA;}

};
class ClassB : public ClassA
{
	public:
		int dataB;

	public:
		virtual int  func_a(void){return dataB + 100;}
		virtual int  func_b(void){return dataB;}
};

int main()

{
	ClassB b;
	ClassA *p = &b;
	b.func_a();
	p->func_a();
	//p->func_b();
	//virtual.cpp:29:5: error: ‘class ClassA’ has no member named ‘func_b’
	//	  p->func_b();

	return 0;

}
