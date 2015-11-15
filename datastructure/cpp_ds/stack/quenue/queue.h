#include <assert.h>

template <class Type> class Queue;

template <class Type> class QueueNode
{
friend class Queue<Type>;
private:
	Type data;
	QueueNode <Type> *link;
public:
	QueueNode(Type d=0,QueueNode *l=NULL);
	~QueueNode();
};

template <class Type> class Queue
{
public:
	Queue();
	~Queue();
	void EnQueue(const Type &item);
	Type DeQueue();
	Type GetFront();
	void MakeEmpty();
	int IsEmpty() const{return front==NULL;}
private:
	QueueNode<Type> *front,*rear;
};

template <class Type> QueueNode<Type>::QueueNode(Type d,QueueNode *l)
{
	data=d;
	link=l;
}

template <class Type> QueueNode<Type>::~QueueNode()
{

}

template <class Type> Queue<Type>::Queue()
{
	rear=front=NULL;
}


template <class Type> Queue<Type>::~Queue()
{
	QueueNode <Type> *p;
	while(front!=NULL)
	{
		p=front;front=front->link;delete p;
	}
}

template <class Type> void Queue<Type>::EnQueue(const Type &item)
{
	if(front==NULL)front=rear=new QueueNode<Type>(item,NULL);
	else rear=rear->link=new QueueNode<Type>(item,NULL);
}

template <class Type> Type Queue<Type>::DeQueue()
{
	assert(!IsEmpty());
	QueueNode<Type> *p=front;
	Type retvalue=p->data;
	front=front->link;delete p;
	return retvalue;
}

template <class Type> Type Queue<Type>::GetFront()
{
	assert(!IsEmpty());
	return front->data;
}

template <class Type> void Queue<Type>::MakeEmpty()
{
	QueueNode <Type> *p;
	while(front!=NULL)
	{
		p=front;front=front->link;delete p;
	}
}
