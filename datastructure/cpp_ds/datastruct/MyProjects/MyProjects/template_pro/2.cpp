#include<iostream.h>
template <class T>
class Sample
{
    T n;
    public:
        Sample(T i){n=i;}
        void operator++();
        void disp(){cout<<"n="<<n<<endl;}
};
template <class T>
void Sample<T>::operator++()
{
    n+=1;      // 不能用n++;因为double型不能用++
}
void main()
{
    Sample<char> s('a');
    s++;
    s.disp();
}
