template<typename T, T nontype_param>
class C
{
};

class Base {
	public:
		int i;
		static int j;
} base;
class Derived : public Base {
} derived_obj;


int a[10];

// 
// 
template <char const* str>
class Message
{
};
extern char const hello[] = "Hello World!";

// 必须加extern 外部链接 不然错误
// error: ‘hello’ cannot appear in a constant-expression
// char const hello[] = "Hello World!";


int main()
{
	// error: could not convert template argument ‘& derived_obj’ to ‘Base*’
	// C<Base*, &derived_obj>* err1; // ERROR: derived-to-base conversions are  not considered
	C<Base*, &base>* valid; //

	// 域运算符(.) 后面的变量不会被看成变量
	// error: invalid type in declaration before ‘;’ token
	//C<int&, base.i>* err2; // ERROR: fields of variables aren't  considered to be variables

	C<int&, Base::j>* valid2; 

    // error: template argument 2 is invalid
	// 不接受单一 数组元素的地址
	// C<int*, &a[0]>* err3; // ERROR: addresses of individual array  elements aren't acceptable either
	 C<int*, a>* valid3; 

	 Message<hello>* hello_msg;

	 (void)valid, (void)valid2, (void)valid3, (void)hello_msg;
	 return 0;
}
