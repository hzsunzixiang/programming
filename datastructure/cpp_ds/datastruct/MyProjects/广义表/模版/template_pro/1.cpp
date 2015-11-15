#include<iostream.h>
template <class T>
T max(T x,T y)
{
    return (x>y?x:y);
}
void main()
{
    cout<<max(2,5)<<","<<max(3.5,2.8)<<endl;
}
