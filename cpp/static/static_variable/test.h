
#include<iostream>
using namespace std;
class X{
		public:
				X(){cout <<"initialize!"<<endl;}
		public:
				int x;
};

class Test{
		public:
				Test();
		private:
				static X x1;

};
