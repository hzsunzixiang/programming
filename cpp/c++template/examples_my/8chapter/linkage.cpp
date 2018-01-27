



int C;
class C // OK: class names and nonclass names are in a different ''space''
{
};

// int X;

// ‘template<class T> struct X’ redeclared as different kind of symbol
template <typename T>
class X // ERROR: conflict with variable X
{
};

// error: ‘S’ is not a template type
// struct S
// {
// };
template <typename T>
class S // ERROR: conflict with struct S
{
};


int main()
{
	return 0;
}
