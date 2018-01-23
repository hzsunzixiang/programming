
#include <list>
#include <vector>
#include <iostream>

using namespace std;

//template <typename T, int N, int M>
template <typename T>
class Shell
{
	public:
		template<int N>
			class In
			{
				public:
					template<int M>
						class Deep
						{
							public:
								virtual void f()
								{
									cout << " in f()" << endl;
								}
						};
			};

};


// template.cpp:47:18:   required from here
// template.cpp:32:9: error: no class template named ‘In’ in ‘class Shell<int>’
//     void case1(typename Shell<T>::template In<N>::template Deep<N> *p)
// 
template<typename T, int N>
class Weird
{
	public:
		 void case1()
		 {
		    typename Shell<T>::template In<N>::template Deep<N> p;
		 	// 这样报错
		 	// template.cpp:31:23: error: expected ‘;’ before ‘::’ token
		 	// p->template Deep<N>::f();
		 	//p->template Deep<N>::f();

		 	p.template f();   // 这样可以

		 	p.f();   // 这样也可以
		 }

		 void case2()
		 {
		    typename Shell<T>::template In<N>::template Deep<N> q;
		    typename Shell<T>::template In<N>::template Deep<N> *p = &q;

		 	// 这样报错
		 	// template.cpp:31:23: error: expected ‘;’ before ‘::’ token
		 	// p->template Deep<N>::f();
		 	//p->template Deep<N>::f();

		 	p->template f();   // 这样可以
			// 下面错误
			// template.cpp: In instantiation of ‘void Weird<T, N>::case2() [with T = int; int N = 100]’:
			// template.cpp:74:14:   required from here
			// template.cpp:64:12: error: invalid use of ‘Shell<int>::In<100>::Deep<100>::Deep’

		 	//p->Deep<100>::f();  // 这样 错误

			// 这样可以
			p->Shell<int>::In<100>::Deep<100>::f();
		 }

		 void case3(typename Shell<T>::template In<N>::template Deep<N> &p)
		 {
		 	p.template f();   // 这样可以
			p.Shell<int>::In<100>::Deep<100>::f();
		 	p.f();   // 这样也可以
		 	// p.Deep<100>::f();  // 这样 错误
		 }
		 void case4(typename Shell<T>::template In<N>::template Deep<N> *p)
		 {
		 	p->template f();   // 这样可以
			p->Shell<int>::In<100>::Deep<100>::f();
		 	p->f();   // 这样也可以
		 	// p.Deep<100>::f();  // 这样 错误
		 }
};


int main()
{
	Weird<int, 100> weird;
    Shell<int>::In<100>::Deep<100> s;
	weird.case1();
	weird.case2();
	weird.case3(s);
	weird.case4(&s);

	//weird.case1(&s);
	//weird.case1(&s);
	return 0;
}
