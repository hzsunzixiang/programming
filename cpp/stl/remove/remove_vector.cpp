#include <iostream>  
#include <vector>  
#include <iterator>   // ostream_iterator
#include <algorithm>  
#include <functional>  

using namespace std;  

int main()  
{  
	vector<int> Numbers;   //vector containing numbers  

	Numbers.push_back(10);  
	Numbers.push_back(20);  
	Numbers.push_back(10);  
	Numbers.push_back(15);  
	Numbers.push_back(12);  
	Numbers.push_back(7);  
	Numbers.push_back(9);  

	vector<int>::iterator  it;  



	cout << "Before calling remove" << endl << "Numbers { " ;  
	copy(Numbers.begin(), Numbers.end(), ostream_iterator<int>(cout, "\t"));
	cout << " }\n" << endl ;  

	// remove all elements from Numbers that match 10  
	vector<int>::iterator ret = remove(Numbers.begin(), Numbers.end(), 10) ;  

	cout << "After calling remove" << endl<< "Numbers { " ;  
	copy(Numbers.begin(), Numbers.end(), ostream_iterator<int>(cout, "\t"));
	cout << " }\n" << endl ;  

	cout << "Total number of elements removed from Numbers = "  
		<< Numbers.end() - ret << endl ;  

	cout << "Valid elements of Numbers { " ;  
	copy(Numbers.begin(), ret, ostream_iterator<int>(cout, "\t"));
	cout << "size:\t" << Numbers.size() << endl;
	cout << " }\n" << endl ;  

	Numbers.erase(ret, Numbers.end());

	cout << "after erase Valid elements of Numbers { " ;  
	copy(Numbers.begin(), Numbers.end(), ostream_iterator<int>(cout, "\t"));
	cout << "size:\t" << Numbers.size() << endl;
	cout << " }\n" << endl ;  


} 
	//cout << "Before calling remove" << endl << "Numbers { " ;  

	//for(it = Numbers.begin(); it != Numbers.end(); it++)  
	//{  
	//	cout << *it << "\t" ;  
	//}  
	//cout << " }\n" << endl ;  
