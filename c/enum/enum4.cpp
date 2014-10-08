//http://www.java2s.com/Tutorial/Cpp/0040__Data-Types/Anenumerationvariable.htm
#include <iostream>
using std::cout;

enum Language { English, French, German, Italian, Spanish };

int main() {

		Language tongue = German;
		cout << "\n Current language is " << tongue;

		return 0;
}
