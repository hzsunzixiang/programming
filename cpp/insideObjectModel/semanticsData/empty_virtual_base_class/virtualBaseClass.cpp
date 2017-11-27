

#include <iostream>
#include <cstdio>
using namespace std;


class X{};
class Y: public virtual X{};
class Z: public virtual X{};
class A: public Y, public Z{};

class YY: public X{};
class ZZ: public X{};
class AA: public YY, public ZZ{};
int main()
{
	printf("sizeof X:%ld\n", sizeof(X));
	printf("sizeof Y:%ld\n", sizeof(Y));
	printf("sizeof Z:%ld\n", sizeof(Z));
	printf("sizeof A:%ld\n", sizeof(A));

	printf("sizeof YY:%ld\n", sizeof(YY));
	printf("sizeof ZZ:%ld\n", sizeof(ZZ));
	printf("sizeof AA:%ld\n", sizeof(AA));
	return 0;
}



// sizeof X:1
// sizeof Y:8
// sizeof Z:8
// sizeof A:16
// sizeof YY:1
// sizeof ZZ:1
// sizeof AA:2

