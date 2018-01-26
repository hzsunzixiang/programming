#include <list>
#include <vector>
using namespace std;
// declares:
// namespace std {

// template <typename T,
// typename Allocator = allocator<T> >
// class list;
// }
template<typename T1,
	typename T2,
	template<typename> class Container>
	// Container expects templates with only
	// one parameter
	class Relation {
		public:
			int x;
		private:
			Container<T1> dom1;
			Container<T2> dom2;
	};


// ../5chapter/templateTemplate/stack7test.cpp:// https://stackoverflow.com/questions/21784913/invalid-argument-in-template-template-parameter?rq=1
// 这里必须用 c++11 编译 否则依然报错
template <typename T>
using my_list = std::list<T>;

template <typename T>
using my_vector = std::vector<T>;

#include <memory>
template<typename T1,
	typename T2,
	template<typename T,
	typename = std::allocator<T> > class Container>
	// Container now accepts standard container templates
	class Relation1 {
		public:
			int i;

		private:
			Container<T1> dom1;
			Container<T2> dom2;
	};
int main()
{
	//  error: type/value mismatch at argument 3 in template parameter list for ‘template<class T1, class T2, template<class> class Container> class Relation’
	// ERROR: std::list has more than one template parameter
	//Relation<int, double, std::list> rel;

	Relation<int, double, my_vector> rel;

	Relation1<int, double, std::list> rel1;
}
