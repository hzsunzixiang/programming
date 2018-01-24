


// https://stackoverflow.com/questions/21784913/invalid-argument-in-template-template-parameter?rq=1


// This is becuase, despite having default arguments, std::vector has 2 template arguments (template < class T, class Alloc = allocator<T> >). The following code works just fine:
#include <vector>

template <typename T, template <typename> class Cont>
class Stack {
	//...
	private:
		Cont<T> s_;
};


template <typename T>
class MyVector
{

};
template <typename T>
using my_vector = std::vector<T>;


int main(){
	Stack<int,my_vector> aStack1;
	// 由于 MyVector 没有第二个参数 所以 下面这个是可行的
	Stack<int,MyVector> aStack2;

}
