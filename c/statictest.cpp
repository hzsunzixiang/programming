#include <iostream>
using namespace std;

class X {
    public:
        static int a;
        long b;
        static char * s;
};


int X::a;

int main() {
      X x = X();
      cout << x.a << endl;
      cout << x.b << endl;
}
