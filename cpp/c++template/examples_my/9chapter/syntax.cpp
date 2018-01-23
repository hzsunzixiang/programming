
#include <list>
#include <vector>

using namespace std;
class X
{
};



//Another example of the maximum munch principle is the less known fact that the scope resolution operator (::) must
//also be used carefully with angle brackets:
int main()
{
	int k<:10];   //  这是合法的 ‘<:’ is an alternate spelling for ‘[’
	vector<int> x;
	// 
	vector< ::X> y;
	//list<::X> many_X; // SYNTAX ERROR!
	//
	//
	//Indeed, the whitespace between the two closing angle brackets is not optional: Without this whitespace, the two >
	//characters combine into a right shift token >>, and hence are never treated as two separate tokens. This is a
	//consequence of the so-called maximum munch tokenization principle: A C++ implementation must collect as many
	//consecutive characters as possible into a token.
	//  这种情况在 4.4 4.9 编译器上均报错
	// syntax.cpp:28:18: error: ‘>>’ should be ‘> >’ within a nested template argument list
	//vector <list<int>> n;
	vector <list<int> > m;
	(void)k;
	(void)x;
	(void)y;
	(void)m;
	return 0;
}

// 提示的非常明确
// syntax.cpp: In function ‘int main()’:
// syntax.cpp:19: error: ‘<::’ cannot begin a template-argument list
// syntax.cpp:19: note: ‘<:’ is an alternate spelling for ‘[’. Insert whitespace between ‘<’ and ‘::’
// syntax.cpp:19: note: (if you use ‘-fpermissive’ G++ will accept your code)



// The problem in the previous example is that the sequence of characters <: is a so-called digraph [4]: an alternative
// representation for the symbol [. Hence, the compiler really sees the equivalent oLf ist[:X> many_X;, which makes no
// sense at all. Again, the solution is to add some whitespace:
// [4] Digraphs were added to the language to ease the input of C++ source with international
// keyboards that lack certain characters (such as #, [, and ]).
// List< ::X> many_X;
// // ^-- whitespace is not optional!
