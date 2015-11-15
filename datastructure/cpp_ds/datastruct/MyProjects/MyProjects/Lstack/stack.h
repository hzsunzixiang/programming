#include<assert.h>
template <class Type> class Stack;
template <class Type> class StackNode {
friend class Stack<Type>;
private: 
    Type data;	                         //结点数据	
    StackNode<Type> *link;	       //结点链指针
public:
    StackNode ( Type d = 0, StackNode<Type> *l = NULL ) : data ( d ), link ( l ) { }
};
template <class Type> class Stack {
private:
    StackNode<Type> *top;       //栈顶指针
public:
    Stack ( ) : top ( NULL ) { }
    ~Stack ( );
    void Push ( const Type & item);
    Type Pop ( );
    Type GetTop ( );
    void MakeEmpty ( );         //实现与~Stack( )同
    int IsEmpty ( ) const { return top == NULL; }
	void Output();
};
template <class Type> Stack<Type>::~Stack ( ) {
     StackNode<Type> *p;
     while ( top != NULL )      //逐结点回收
 	 { p = top;  top = top->link;  delete p; }
}

template <class Type> void Stack<Type>::Push ( const Type &item ) {
    top = new StackNode<Type> ( item, top );
    //新结点链入top之前, 并成为新栈顶
}
template <class Type> Type Stack<Type>::Pop ( ) {//删除栈顶结点，并返回其值
    assert(!IsEmpty());			
    StackNode<Type> *p = top;
    Type retvalue = p->data;     //暂存栈顶数据
    top = top->link;       //修改栈顶指针
    delete p;   return retvalue;   //释放,返回数据
}

template <class Type> Type Stack<Type>::GetTop ( ) {
    assert(!IsEmpty());
    return top->data;
}
template <class Type> void  Stack<Type>::Output( ) {			  
               StackNode<Type> *p;
			   p=top;
			   if(top==0)
				   cout<<"Empty"<<endl;
			   else{
			   cout<<"the members in the stack"<<endl; 
			   while(top)
				  {
				     
			         cout<<GetTop()<<endl;
			         top=top->link;
				   }
			   }
			   top=p;
}