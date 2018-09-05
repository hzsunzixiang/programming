#include <functional>
#include <iostream>

struct Foo {
	Foo(int num) : num_(num) {}
	void print_add(int i) const { std::cout << num_+i << '\n'; }
	int num_;
};

void print_num(int i)
{
	std::cout << i << '\n';
}

void print_num_s(int i, const std::string & s)
{
	std::cout << i << "\t" <<  s <<'\n';
}

struct PrintNum {
	void operator()(int i) const
	{
		std::cout << i << '\n';
	}
};

typedef std::function<void (int, const std::string &)> HTTPRequestHandler;
int main()
{
	// store a free function
	std::function<void(int)> f_display = print_num;
	const HTTPRequestHandler &p = print_num_s;
	//HTTPRequestHandler p = print_num_s;

	p(-9, "hello");

    std::function<void (int, const std::string &)> p1;
	p1 = print_num_s;

	p1(9, "world");

}



