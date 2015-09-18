class ClassA

{

	public:

		int dataA;

	public:

		virtual int  func_a(void){return dataA;}

};

int main()

{
	ClassA a;
	return 0;

}
