//http://www.java2s.com/Tutorial/Cpp/0040__Data-Types/Defineandoutputanenumeration.htm

#include <iostream>
using std::cout;

enum Language { English, French, German, Italian, Spanish, Chinese };

int main() {

		cout << "\nPossible languages are:\n"
				<< English << ". English\n"
				<< French  << ". French\n"
				<< German  << ". German\n"
				<< Italian << ". Italian\n"
				<< Spanish << ". Spanish\n";

		return 0;
}
