#include <algorithm>
#include <iostream>
#include <vector>

namespace {
	struct f {
		void operator()(int) {
			// do something
		}
	};
}

void func(std::vector<int>& v) {
	f f;
	std::for_each(v.begin(), v.end(), f);
}

void func2(std::vector<int>& v) {
	struct {
		void operator()(int) {
			// do something
		}
	} f;
	std::for_each(v.begin(), v.end(), f);
}

void func4(std::vector<double>& v) {
	std::transform(v.begin(), v.end(), v.begin(),
			[](double d) { return d < 0.00001 ? 0 : d; }
			);
}
//void func4(std::vector<double>& v) {
//	std::transform(v.begin(), v.end(), v.begin(),
//			[](double d) {
//			if (d < 0.0001) {
//			return 0;
//			} else {
//			return d;
//			}
//			});
//}
void func5(std::vector<double>& v) {
	std::transform(v.begin(), v.end(), v.begin(),
			[](double d) -> double {
			if (d < 0.0001) {
			return 0;
			} else {
			return d;
			}
			});
}

void func6(std::vector<double>& v, const double& epsilon) {
	std::transform(v.begin(), v.end(), v.begin(),
			[epsilon](double d) -> double {
			if (d < epsilon) {
			return 0;
			} else {
			return d;
			}
			});
}


int main()
{
	[]() { } ;
	[]() mutable -> int { };

    // warning: lambda capture initializers only available with -std=c++14 or -std=gnu++14
	int x = 4;
	auto y = [&r = x, x = x+1]()->int {
		r += 2;
		return x+2;
	}();  // Updates ::x to 6, and initializes y to 7.

	std::cout << "x\t" << x << "\ty\t" << y << std::endl;
	auto lambda = [](auto x, auto y) {return x + y;};
	std::cout << lambda(1,2) << std::endl;


	auto algorithm = [&]( double x, double m, double b ) -> double
	{
		return m*x+b;
	};

	int a=algorithm(1,2,3), b=algorithm(4,5,6);
	std::cout << a << "\t" << b << std::endl;


	auto x1 = [=](int arg1){printf("%i", arg1); };
	//void(*f)(int) = x1;
	//f(1);
	x1(1);

	return 0;
}



