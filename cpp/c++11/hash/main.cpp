#include <iostream>
#include <iomanip>
#include <functional>
#include <string>
#include <unordered_set>

struct S {
	std::string first_name;
	std::string last_name;
};
bool operator==(const S& lhs, const S& rhs) {
	return lhs.first_name == rhs.first_name && lhs.last_name == rhs.last_name;
}

// custom hash can be a standalone function object:
struct MyHash
{
	std::size_t operator()(S const& s) const noexcept
	{
		std::size_t h1 = std::hash<std::string>{}(s.first_name);
		std::size_t h2 = std::hash<std::string>{}(s.last_name);
		return h1 ^ (h2 << 1); // or use boost::hash_combine (see Discussion)
	}
};

// custom specialization of std::hash can be injected in namespace std
namespace std
{
	// 被 unordered_set 所使用
	template<> struct hash<S>
	{
		typedef S argument_type;
		typedef std::size_t result_type;
		result_type operator()(argument_type const& s) const noexcept
		{
			result_type const h1 ( std::hash<std::string>{}(s.first_name) );
			result_type const h2 ( std::hash<std::string>{}(s.last_name) );
			return h1 ^ (h2 << 1); // or use boost::hash_combine (see Discussion)
		}
	};
}

int main()
{

	std::string str = "Meet the new boss...";
	//std::hash<std::string>{};
	//std::hash<std::string>();
	// 生成一个对象 然后调用 operator()
	std::size_t str_hash = std::hash<std::string>{}(str);

	str_hash = std::hash<std::string>()(str);

	// c++11 不支持 error: ‘quoted’ is not a member of ‘std’
	std::cout << "hash(" << std::quoted(str) << ") = " << str_hash << '\n';

	S obj = { "Hubert", "Farnsworth"};
	// using the standalone function object
	std::cout << "hash(" << std::quoted(obj.first_name) << ',' 
		<< std::quoted(obj.last_name) << ") = "
		<< MyHash{}(obj) << " (using MyHash)\n                           or "
		<< std::hash<S>{}(obj) << " (using injected std::hash<S> specialization)\n";

	// custom hash makes it possible to use custom types in unordered containers
	// The example will use the injected std::hash<S> specialization above,
	// to use MyHash instead, pass it as a second template argument
	std::unordered_set<S> names = {obj, {"Bender", "Rodriguez"}, {"Leela", "Turanga"} };
	for(auto& s: names)
		std::cout << std::quoted(s.first_name) << ' ' << std::quoted(s.last_name) << '\n';
}
