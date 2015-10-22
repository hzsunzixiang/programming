/* The following code example is taken from the book
 * "C++ Templates - The Complete Guide"
 * by David Vandevoorde and Nicolai M. Josuttis, Addison-Wesley, 2002
 *
 * (C) Copyright David Vandevoorde and Nicolai M. Josuttis 2002.
 * Permission to copy, use, modify, sell and distribute this software
 * is granted provided this copyright notice appears in all copies.
 * This software is provided "as is" without express or implied
 * warranty, and with no claim as to its suitability for any purpose.
 */
template <typename T> 
class Safe {
};

typedef char Block[0];  // would fail for N<0
template <int N>
class Danger {
	public:
		typedef char Block[N];  // would fail for N<0
};

template <typename T, int N>
class Tricky {
	public:
		virtual ~Tricky() {
		}
		void no_body_here(Safe<T> = 3);
		void inclass() { 
			Danger<N> no_boom_yet;
		}
		//void error(T (*p)[N])   // 看汇编，不使用时不会实例化这个函数, 但是会 检查参数合法性 ,main中  定义 Tricky<int, 1> ok; 时报错 
		void error()        // 看汇编，不适用时不会实例化这个函数
		{
			//Danger<1> boom;  // 
			Danger<-1> boom;  //  这里不报错，只有使用的时候报错 使用的时候才实例化 main中如果只定义Tricky<int, 1> ok; 而不调用error(), 则不报错 
		}
		//Danger<-1> boom;  // 声明 ，会报错，即使没有main函数
		//void unsafe(T (*p)[N]);  // 声明，只有在main中使用时报错
		// void unsafe(T (*p)[N])  // 参数中需要实例化，不管是声明还是定义,在main中都会报错
		// {
		// }
		T operator->();
		// virtual Safe<T> suspect(); // 即使T参数合法，也编译不过，需要虚函数的地址，放在虚函数表中

		// 不使用时是不会报错
		struct Nested { 
			Danger<N> pfew; 
		};

		// 不使用时是不会报错
		union {  // anonymous union
			int align;
			Safe<T> anonymous;
		};
};

int main()
{
	//Tricky<int, 1> ok;   // 参数合法虚函数也会报错，必须有定义
	Tricky<int, 1> ok;
	//ok.error();  // 只有使用的时候才会实例化， 才会引发 错误
}
