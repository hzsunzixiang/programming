

// https://codereview.stackexchange.com/questions/98329/stdstring-implementation
// https://stackoverflow.com/questions/3106110/what-are-move-semantics/11540204#11540204
//https://codereview.stackexchange.com/questions/98329/stdstring-implementation



#include <cstring>
#include <algorithm>

class string
{
	char* data;

	public:

	string(const char* p)
	{
		size_t size = strlen(p) + 1;
		data = new char[size];
		memcpy(data, p, size);
	}
	~string()
	{
		delete[] data;
	}

	string(const string& that)
	{
		size_t size = strlen(that.data) + 1;
		data = new char[size];
		memcpy(data, that.data, size);
	}
};


int main()
{
	char c[]= "hello,world!";
	string x(c);
	string y(c);
	string a(x);                                    // Line 1
	//string b(x + y);                                // Line 2
	//string c(some_function_returning_a_string());   // Line 3
	return 0;
}
