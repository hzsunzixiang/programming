#include<assert.h>
template <class Type> class Queue;
template <class Type> class QueueNode {
friend class Queue<Type>;
private: 
    Type data;	//队列结点数据
	int flag;

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
    void EnQueue ( const Type & item,const int &F );//将item加入队列中
    Type DeQueue ( );//删除并返回队头元素
    Type GetFront_data( );//查看队头元素
	int  GetFront_flag( );			
    void MakeEmpty ( ); //置空队列,实现与~Queue( )同
	int CreateQueue();
	void Output();
	void Game(int n);
	void Game();
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
template <class Type> void Queue<Type>:: EnQueue ( const Type & item,const int &F ){
//将新元素item插入到队列的队尾 
    if ( front == NULL )    //空, 创建第一个结点
	front = rear = new QueueNode<Type> ( item, F,NULL );
    else                               //队列不空, 插入
         rear = rear->link = new QueueNode<Type> ( item,F, NULL );
}
template <class Type> Type Queue<Type>::DeQueue ( ) {
//删去队头结点，并返回队头元素的值
    assert(!IsEmpty());	//队列不空时继续执行
    QueueNode<Type> *p = front;
    Type retvalue=p->data;//取出队头结点的值
    front = front->link; 	      //新队头
    delete p;//释放原队头结点
    return  retvalue;//返回原队头结点的值
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
template <class Type> void Queue<Type>::Output() {//输出队列
	QueueNode<Type>  *p;
	p=front;
	if(front==NULL)
		cout<<"Empty!"<<endl;
	else{
		cout<<"the member in the queue"<<endl;
		while(front!=NULL)
		{
			//cout<<"member"<<endl; 
			cout<<GetFront_data()<<"  "<<GetFront_flag()<<endl;
			front=front->link;
		}
	   }
	   front=p;
}
template <class Type> void Queue<Type>::Game(int n) {//游戏，每张牌被翻过的次数记录
	int temp2;
	for(int i=2;i<=n;i++)
		for(int j=1;j<=n;j++){
			temp2=GetFront_flag();				
			if(GetFront_data()%i==0) {DeQueue();EnQueue(j,++temp2);}
			else{DeQueue();EnQueue(j,temp2);}
		}
		cout<<"please enter 4 to display the contents in the queue:"<<endl;
		cout<<"or enter 3 to display the result:"<<endl<<endl<<endl;
}
template <class Type> void Queue<Type>::Game() {//显示游戏结果，之后，队列为空
	QueueNode<Type> *p=front;
	int count=0;
	while(!IsEmpty()){
		if(GetFront_flag()%2!=0){
			cout<<GetFront_data()<<endl;
			DeQueue();
			count++;
		}
		else {
			DeQueue();	
		}
	}
	cout<<"the total number who is up is :"<<count<<endl;
}
template <class Type> int Queue<Type>::CreateQueue() {
	  	cout<<"create a queue"<<endl;
		cout<<"please enter the number of the card:"<<endl;
		int s,j,Flag ;
		Flag=1;
		cin>>s;
		for(j=1;j<=s;j++){
			EnQueue(j,Flag);
		}
		return s;
}