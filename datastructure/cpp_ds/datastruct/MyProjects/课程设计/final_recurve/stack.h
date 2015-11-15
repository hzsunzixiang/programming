#include <assert.h>
const int max=100;
template <class Type> class Stack {
public:
    Stack ( int=max );                              //构造函数
    ~Stack ( ) { delete [ ] elements; }    //析构函数
    int Push ( const Type & item );   //进栈
    Type Pop ( );                                   //出栈
    Type GetTop ( );    //取栈顶
    int IsEmpty ( ) const { return top == -1; }
    void Output( ) ;
	void CreateStack(char *ele);
	int ReturnTop(){return top;}
	int Length(){return top+1;}
	void MakeEmpty ( ) { top = -1; }  
	int IsFull ( ) const { return top == maxSize-1; }
	int operator==(const Stack<Type> &stack);
	friend int operator==(Stack<Type> &stack1,Stack<Type> &stack2);
	Stack<Type> & operator=(Stack<Type> &stack);
	int Recurve(char *ele);
	void re_top(int i){top=i;}
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
    if( IsFull ( ) )
		return 0;
    else{
		elements[++top] = item;    //加入新元素
	    return 1;}
}
template <class Type> void Stack<Type>:: CreateStack(char *ele){
	int n=strlen(ele);
	for(int j=0;j<n;j++){	
		Push(ele[j]);
	}
	re_top(n-1);
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
	cout<<"the passage you  input is :"<<endl<<endl;
               int temp;
			   temp=top;
			   if(top==-1) cout<<"empty";
			   while(top>-1)
				  {
			         cout<<GetTop();
			         top--;
				   }
			   top=temp;
			   cout<<endl;
}
int operator==(Stack<char> &stack1,Stack<char> &stack2){
	if(stack1.Length()!=stack2.Length()) return 0;
	else{
		for(int i=0;i<stack1.Length();i++){
			if(stack1.elements[i]!=stack2.elements[i])return 0;
		}
		if(i==stack1.Length()) return 1;
	}
}
template <class Type> Stack<Type> &Stack<Type>::operator=(Stack<Type> &stack){  
	for(int i=0;i<stack.Length();i++){
		this->elements[i]=stack.elements[i];
	}
	this->re_top(stack.Length()-1);
	return *this;
}
template <class Type> int Stack<Type>::Recurve(char *ele){
	CreateStack(ele);
	Stack<Type> st,temp;
	temp=*this;	
	while(IsEmpty ( )==0){
		st.Push(GetTop());
		Pop();
	}
	st.Output();
	if(temp==st)
		cout<<"this is a recurve passage!"<<endl;	

	else 
		cout<<"this is not a recurve passage!"<<endl;
	return 1;
}

