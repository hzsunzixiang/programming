#include<assert.h>
template <class Type> class Queue;
template <class Type> class QueueNode {
friend class Queue<Type>;
private: 
    Type data;	//队列结点数据
	int flag;   //纸牌被翻动次数的标志 
    QueueNode<Type> *link;    //结点链指针
public:
    QueueNode ( Type d=0,int f=0, QueueNode *l=NULL ) : data (d),flag(f),link (l) { }
};
template <class Type> class Queue {	
private: 
    QueueNode<Type> *front, *rear; //队列指针
public: 
    Queue ( ) : rear ( NULL ), front ( NULL ) { }
    ~Queue ( );	
	int CreateQueue();
    void EnQueue ( const Type & item,const int &F );//进队
    void DeQueue ( );//出队
    Type GetFront_data( );//查看队头元素
	int  GetFront_flag( );//查看flag
	void Game(int n);
    int IsEmpty ( ) const { return front == NULL; }//判空
};
template <class Type>
Queue<Type>::~Queue ( ) {
//队列的析构函数
    QueueNode<Type> *p;
    while ( front != NULL ) {	     //逐个结点释放
        p = front;  front = front->link;  delete p;
    }
}
template <class Type> int Queue<Type>::CreateQueue() {//创建队列
		cout<<"请输入牌的数目:"<<endl;
		int s,j,Flag ;
		Flag=0;
		cin>>s;
		for(j=1;j<=s;j++){
			EnQueue(j,Flag);
		}
		return s;
}
template <class Type> void Queue<Type>:: EnQueue ( const Type & item,const int &F ){
//将新元素item插入到队列的队尾 
    if ( front == NULL )    //空, 创建第一个结点
	front = rear = new QueueNode<Type> ( item, F,NULL );
    else                               //队列不空, 插入
         rear = rear->link = new QueueNode<Type> ( item,F, NULL );
}
template <class Type> void Queue<Type>::DeQueue ( ) {
//删去队头结点，并返回队头元素的值
    if(IsEmpty()==0){	//队列不空时继续执行
    QueueNode<Type> *p = front;
    Type retvalue=p->data;//取出队头结点的值
    front = front->link; 	      //新队头
    delete p;//释放原队头结点
	}
	else
		cout<<"队列为空"<<endl;
}
template <class Type> Type Queue<Type>::GetFront_data() {
//若队不空，则函数返回队头元素的值; 
    assert(!IsEmpty()) ;			
    return front->data;				
}
template <class Type> int Queue<Type>::GetFront_flag() {
	assert(!IsEmpty());
	return front->flag;
}
template <class Type> void Queue<Type>::Game(int n) {//纸牌游戏，直接输出结果
	cout<<"向上的牌的编号为:"<<endl;
	Type temp1;
	int count,temp2;
	count=0;
	for(int i=1;i<=n;i++)
		for(int j=i;j<=n;j++){
			if(j==i){
				if(GetFront_flag()%2==0) {			
					cout<<"             "<<GetFront_data()<<endl;count++;
				}
				DeQueue();	
			}
			else{
				temp1=GetFront_data();
				temp2=GetFront_flag();
				if(temp1%(i+1)==0) {DeQueue();EnQueue(temp1,++temp2);}
				else  {DeQueue();EnQueue(j,temp2);}
			}
		}
		cout<<"向上的牌的总数为：  "<<count<<endl;
}
