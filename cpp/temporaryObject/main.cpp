// https://stackoverflow.com/questions/27463785/cant-pass-temporary-object-as-reference


class Foo
{
	public:
		Foo(int x) {};
};

void ProcessFoo(Foo& foo)
{
}

// 如果再加一个重载 就不会报错了
void ProcessFoo(const Foo& foo)
{
}


int main()
{
	ProcessFoo(Foo(42));
	// main.cpp:17:9: error: invalid initialization of non-const reference of type ‘int&’ from an rvalue of type ‘int’
	//int &x=9;
	//int const &x=9;
	return 0;
}


// main.cpp: In function ‘int main()’:
// main.cpp:16:20: error: invalid initialization of non-const reference of type ‘Foo&’ from an rvalue of type ‘Foo’
//   ProcessFoo(Foo(42));
//                     ^
// main.cpp:10:6: note: in passing argument 1 of ‘void ProcessFoo(Foo&)’
//  void ProcessFoo(Foo& foo)

