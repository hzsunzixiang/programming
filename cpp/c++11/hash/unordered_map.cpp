#include <iostream>
#include <limits>
#include <string>
#include <memory>
#include <unordered_map>


using namespace std;
struct S {
	std::string first_name;
	std::string last_name;
};

// 必须要有这个 不然报错

// error: no match for ‘operator==’ (operand types are ‘const S’ and ‘const S’)
bool operator==(const S& lhs, const S& rhs) {
	return lhs.first_name == rhs.first_name && lhs.last_name == rhs.last_name;
}

 
// custom specialization of std::hash can be injected in namespace std
namespace std
{
	// 被 unordered_map 所使用
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
class SaltedOutpointHasher
{
private:
    /** Salt */
    const uint64_t k0, k1;

public:
    SaltedOutpointHasher():k0(1),k1(19) 
	{ 
		std::cout << "constructor" << std::endl;
	}

    /**
     * This *must* return size_t. With Boost 1.46 on 32-bit systems the
     * unordered_map will behave unpredictably if the custom hasher returns a
     * uint64_t, resulting in failures when syncing the chain (#4634).
     */
	// 只有在 插入的时候才调用 z这里
	size_t operator()(const S& s) const {
		std::cout << ".................." << std::endl;
		typedef S argument_type;
		typedef std::size_t result_type;
		result_type const h1 ( std::hash<std::string>{}(s.first_name) );
		result_type const h2 ( std::hash<std::string>{}(s.last_name) );
		return h1 ^ (h2 << 1); // or use boost::hash_combine (see Discussion)
	}
};
void fun_test()
{
	typedef std::unordered_map<S, std::string> CCoinsMap;
	// 可以看出 SaltedOutpointHasher的 重载调用以 第一个参数做参数 
	typedef std::unordered_map<S, std::string, SaltedOutpointHasher> CCoinsMap1;
	std::numeric_limits<uint64_t>::max();
}
int main()
{
	// Create an unordered_map of three strings (that map to strings)
	std::unordered_map<std::string, std::string> u = {
		{"RED","#FF0000"},
		{"GREEN","#00FF00"},
		{"BLUE","#0000FF"}
	};

	// Iterate and print keys and values of unordered_map
	for( const auto& n : u ) {
		std::cout << "Key:[" << n.first << "] Value:[" << n.second << "]\n";
	}

	// Add two new entries to the unordered_map
	u["BLACK"] = "#000000";
	u["WHITE"] = "#FFFFFF";

	// Output values by key
	std::cout << "The HEX of color RED is:[" << u["RED"] << "]\n";
	std::cout << "The HEX of color BLACK is:[" << u["BLACK"] << "]\n";

	std::unordered_map<std::string, S> u1;
	///usr/include/c++/6/bits/hashtable_policy.h:85:34: error: no match for call to ‘(const std::hash<S>) (const S&)’
	//  noexcept(declval<const _Hash&>()(declval<const _Key&>()))>
	// 必须定义 template<> struct hash<S>
	//  不然报错
	std::unordered_map<S, std::string> u2;
	std::cout << std::numeric_limits<uint64_t>::max() << std::endl;

	S obj = { "Hubert", "Farnsworth"};
	S obj1 = { "Hubert1", "Farnsworth1"};

	typedef std::unordered_map<S, std::string, SaltedOutpointHasher> CCoinsMap;
	// 这里构造一个
	CCoinsMap *p = new CCoinsMap();
	
	// 只有这里才会调用构造函数
	//CCoinsMap xx;
	std::unique_ptr<CCoinsMap> pcoinsTip;
	pcoinsTip.reset(p);
	cout << pcoinsTip.get() << endl;
	(*pcoinsTip)[obj]="hello";

	// 这里才会调用 operator()
	//xx[obj]="hello";

	return 0;
}
