#include <assert.h>
template <class Type> class Stack {
public:
    Stack ( int=1 );                              //构造函数
    ~Stack ( ) { delete [ ] elements; }    //析构函数
    int Push ( const Type & item );   //进栈
    Type Pop ( );                                   //出栈
    Type GetTop ( );                             //取栈顶
    void MakeEmpty ( ) { top = -1; }    //置空栈
    int IsEmpty ( ) const { return top == -1; }
    int IsFull ( ) const { return top == maxSize-1; }
	void Stackfull();
    void Output( ) ;	
private:
    int top;	                       //栈顶指针
    Type *elements;	     //栈数组		
    int maxSize;	              //栈最大容量		
};
template <class Type> Stack<Type>::Stack ( int s ) : top (-1), maxSize (s) {
     elements = new Type[maxSize];	
     assert ( elements != 0 );//断言:动态分配成功否
}
//若栈未满，将元素插入到栈顶，否则出错
template <class Type> int Stack<Type>::Push ( const Type & item ) {   
    //if( IsFull ( ) )
	//	return 0;
   // else{
		elements[++top] = item;    //加入新元素
	    return 1;
	//}
}
//若栈不空，返回栈顶元素的值，栈顶指针减1
template <class Type> Type Stack<Type>::Pop ( ) {
    assert(!IsEmpty());              //先决条件断言
    return elements[top--];      //返回栈顶元素的值，top--
}
template <class Type> Type Stack<Type>::GetTop ( ) {
    assert ( !IsEmpty ( ) );	   //先决条件断言
    return elements[top];         //取出栈顶元素
}	
template <class Type> void  Stack<Type>::Output( ) {			  
               int temp;
			   temp=top;
			   while(top>-1)
				  {
				     //cout<<"member"<<endl;
			         cout<<GetTop()<<endl;
			         top--;
				   }
			   top=temp;
}
template <class Type> void  Stack<Type>::Stackfull( ) {
		Type *temp
		temp= new Type[maxSize];	
		temp=elements
		elements = new Type[2*maxSize];	
        //assert ( elements != 0 );//断言:动态分配成功否
		elements=temp;
		top=maxSize-1;
}






