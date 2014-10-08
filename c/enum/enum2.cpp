//http://www.java2s.com/Tutorial/Cpp/0040__Data-Types/ADemonstrationofEnumeratedConstants.htm
#include <iostream>
int main()
{
		enum Days { Sunday, Monday, Tuesday,Wednesday, Thursday, Friday, Saturday };

		Days today;
		today = Monday;

		if (today == Sunday || today == Saturday)
				std::cout << " love the weekends!\n";
		else
				std::cout << "\nBack to work.\n";

		return 0;
}
