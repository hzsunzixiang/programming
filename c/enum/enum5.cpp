//http://www.java2s.com/Tutorial/Cpp/0040__Data-Types/Anenumerationstaticcast.htm
#include <iostream>
using std::cout;

enum Language { English, French, German, Italian, Spanish, Chinese };

int main() {

		Language tongue = German;
		tongue = static_cast<Language>(tongue + 1);

		cout << "\n Current language is now " << tongue
				<< std::endl;


		return 0;
}
