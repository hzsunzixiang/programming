#include <stdio.h>

class Base {
	public: 
		//virtual void gogo(int a){
		//	printf(" Base :: gogo (int) \n");
		//};

		virtual void gogo(char a){
			printf(" Base :: gogo (char) \n");
		};
		virtual void gogo(int* a){
			printf(" Base :: gogo (int*) \n");
		};
};

class Derived : public Base{
	public:
		void gogo(int* a){
			printf(" Derived :: gogo (int*) \n");
		};
};

int main(){
	Derived obj;
	int x = 100;
	obj.gogo(&x);
	char c = 50;
	//obj.gogo(c);
}
