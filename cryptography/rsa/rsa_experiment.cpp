

// C++ program to find multiplicative modulo inverse using
// Extended Euclid algorithm.
#include<iostream>
#include<cmath>
using namespace std;

// C function for extended Euclidean Algorithm
int gcdExtended(int a, int b, int *x, int *y);

// Function to find modulo inverse of a
int modInverse(int a, int m)
{
	int x, y;
	int g = gcdExtended(a, m, &x, &y);
	if (g != 1)
	{
		cout << "Inverse doesn't exist";
		return 0;
	}
	else
	{
		// m is added to handle negative x
		int res = (x%m + m) % m;
		//cout << "Modular multiplicative inverse is " << res;
		return res;
	}
}

// C function for extended Euclidean Algorithm
int gcdExtended(int a, int b, int *x, int *y)
{
	// Base Case
	if (a == 0)
	{
		*x = 0, *y = 1;
		return b;
	}

	int x1, y1; // To store results of recursive call
	int gcd = gcdExtended(b%a, a, &x1, &y1);

	// Update x and y using results of recursive
	// call
	*x = y1 - (b/a) * x1;
	*y = x1;

	return gcd;
}

// Driver Program
int rsa1()
{
	// int a = 17, m = 55;
	// cout << "Modular multiplicative inverse is " << modInverse(a, m) << endl;
	int t = 3;   // 明文 
	int p = 43; 
	int q = 59;
	int n = q * p;
	int phai_n = 42 * 58;
	int pub = 13; // 公钥
	int priv =  modInverse(13, phai_n); // 私钥
	cout << "priv:\t" << priv <<endl;
	// 这个数太大 换一个
	//int secret = pow(3, 937)
	return 0;
}

int rsa0()
{
	// int a = 17, m = 55;
	// cout << "Modular multiplicative inverse is " << modInverse(a, m) << endl;
	// 私钥和秘钥 太巧合 一样了
	int t = 2;   // 明文 
	int p = 3; 
	int q = 5;
	int n = q * p;
	int phai_n = 2 * 4;
	int pub = 3; // 公钥
	int priv =  modInverse(pub, phai_n); // 私钥
	cout << "priv:----\t" << priv <<endl; // 3 
	int secret = pow(t, priv);
	secret %= n;
	

	cout << "secret:----\t" << secret <<endl; // 8
	
	//// 解密
	int text = pow(secret, pub);
	text %= n;
	cout << "text :----\t" << text <<endl; // 2
	return 0;
}


int main()
{
	rsa0();
	//rsa2();
	return 0;
}
