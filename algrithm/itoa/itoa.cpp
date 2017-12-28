
// http://www.cplusplus.com/reference/cstdlib/itoa/
// char *  itoa ( int value, char * str, int base );
// Convert integer to string (non-standard function)
// Converts an integer value to a null-terminated string using the specified base and stores the result in the array given by str parameter.
// 
// If base is 10 and value is negative, the resulting string is preceded with a minus sign (-). With any other base, value is always considered unsigned.
// 
// str should be an array long enough to contain any possible value: (sizeof(int)*8+1) for radix=2, i.e. 17 bytes in 16-bits platforms and 33 in 32-bits platforms.




/* A C++ program to implement itoa() */
#include <iostream>
using namespace std;
 
/* A utility function to reverse a string  */
void reverse(char str[], int length)
{
    int start = 0;
    int end = length -1;
    while (start < end)
    {
        swap(*(str+start), *(str+end));
        start++;
        end--;
    }
}
 
// Implementation of itoa()
char* itoa(int num, char* str, int base)
{
    int i = 0;
    bool isNegative = false;
 
    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (num == 0)
    {
        str[i++] = '0';
        str[i] = '\0';
        return str;
    }
 
    // In standard itoa(), negative numbers are handled only with 
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10)
    {
        isNegative = true;
        num = -num;
    }

    if (num < 0 && base != 10)
	{
		str[0] = '\0';
		return str;
	}
 

    // Process individual digits
    while (num != 0)
    {
        int rem = num % base;
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        num = num/base;
    }
 
    // If number is negative, append '-'
    if (isNegative)
        str[i++] = '-';
 
    str[i] = '\0'; // Append string terminator
 
    // Reverse the string
    reverse(str, i);
 
    return str;
}
 
// Driver program to test implementation of itoa()
int main()
{
    char str[100];
    cout << "Base:10 " << itoa(1567, str, 10) << endl;
    cout << "Base:10 " << itoa(-1567, str, 10) << endl;
    cout << "Base:2 " << itoa(1567, str, 2) << endl;
    cout << "Base:8 " << itoa(1567, str, 8) << endl;
    cout << "Base:16 " << itoa(1567, str, 16) << endl;
    cout << "Base:16 " << itoa(0, str, 16) << endl;
    cout << "Base:16 " << itoa(-19999, str, 16) << endl;
    return 0;
}
