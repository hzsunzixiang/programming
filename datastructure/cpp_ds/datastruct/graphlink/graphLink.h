#include"Queue.h"
const int DefaultSize=10;

template <class NameType, class DistType> class Graph;				//图的前视类定义

template <class DistType> class Edge {				//边的定义
public:
   friend class Graph<class NameType,class DistType>;	
   int dest;							//边的另一顶点位置, 第一个顶点位置是隐式的
   DistType cost;						//边上的权值
   Edge<DistType> *link;						//下一条边链指针
   Edge ( ) {link=NULL; }								//构造函数
   Edge ( int D, DistType C ) : dest (D), cost (C), link (NULL) { }	//构造函数
   int operator != ( const Edge &E ) const { return dest != E.dest; }
};

template <class NameType, class DistType> class Vertex {		//顶点的定义
public:
   friend class Graph<NameType,DistType>;
   friend class Edge <class DistType>;	
   NameType data;							//顶点的名字
   Edge<DistType> *adj;							//出边表的头指针
};
#ifndef SetMaxVertices
#define SetMaxVertices
const int MaxNumVertices=10;
#endif
////const DefaultSize = 20;
template <class NameType, class DistType> class Graph
{		//图的类定义
//friend class Vertex <NameType, DistType>;
//friend class Edge<DistType>;
private:
   Vertex<NameType, DistType> *NodeTable;			//顶点表 (各边链表的头结点)
   int NumVertices;							//当前顶点个数
   int MaxNumVertices;							//最大顶点个数
   int NumEdges;								//当前边数
   int GetVertexPos ( const NameType & vertex );				//给出顶点vertex在图中的位置
public:
   Graph (const int sz=DefaultSize );								//构造函数
   ~Graph ( );								//析构函数
   int GraphEmpty ( ) const { return NumVertices == 0; }		//测试图空否
   int GraphFull ( ) const							//测试图满否
	  { return NumVertices == MaxNumVertices||NumEdges ==MaxNumEdges; }
   int NumberOfVertices ( ) { return NumVertices; }			//返回图的顶点数
   int NumberOfEdges ( ) { return NumEdges; }			//返回图的边数
   NameType GetValue ( const int i )					//取位置为i的顶点中的值
	  { return i >= 0 && i < NumVertices ? NodeTable[i].data : NULL; }
   void InsertVertex ( const NameType & vertex );			//在图中插入一个顶点
   void RemoveVertex ( const int v );					//在图中删除一个顶点
   void InsertEdge ( const int v1, const int v2, const DistType weight );		//在图中插入一条边
   void RemoveEdge ( const int v1, const int v2 );			//在图中删除一条边
   DistType GetWeight ( const int v1, const int v2 );			//返回边上的权值
   int GetFirstNeighbor ( const int v );				//取顶点v的第一个邻接顶点
   int GetNextNeighbor ( const int v1, const int v2 );		//取顶点v1的某邻接顶点v2的下一个邻接顶点
   void OutPut();
   void OutPutEach();
   //int GetVertexPos ( const NameType & vertex );
   void DFS ( );
   void DFS ( const int v, int visited [ ] );
   void BFS ( int v );
   //void DfnLow ( const int x );
   //void DfnLow ( const int u, const int v );
   //void Components ( );
   //void Biconnected ( );
   //void Biconnected ( const int u, const int v );
   //void CriticalPath();
};


const int MaxNumEdges=20;
template <class NameType, class DistType>Graph <NameType, DistType>::
Graph ( const int sz=DefaultSize ) : NumVertices (0), MaxNumVertices (sz), NumEdges (0) {
   int n, e, k, j;
   NameType name, tail, head;
   DistType weight;
   NodeTable = new Vertex<NameType,DistType>[MaxNumVertices];			//创建顶点表数组
   cout<<"Please enter the number of the vertex:"<<endl;
   cin >> n;										//输入顶点个数   
   assert(n<=sz);   
   cout<<"Please enter the vertex:"<<endl;
   for ( int i=0; i<n; i++)
   {
     cin >> name;
     InsertVertex ( name );
	 cout<<"continue:"<<endl;
   }		//依次输入顶点, 插入图中
   cout<<"Please enter the number of the edge:"<<endl;
   cin >> e;										//输入边数   
   assert(e<=MaxNumEdges);   
   cout<<"Please enter the edge:start end and cost:"<<endl;
   for ( i=0; i<e; i++) {								//依次输入边信息
	 cin >> tail >> head >> weight;						//输入各边
	 k = GetVertexPos ( tail );  j = GetVertexPos ( head );			//取两顶点位置
	 InsertEdge ( k, j, weight );	//插入图中
	 cout<<"continue:"<<endl;
   }
}

template <class NameType, class DistType> Graph<NameType, DistType>::~Graph ( ) {
   for ( int i=0; i<NumVertices; i++ ) {						//删除各边链表中的结点
	 Edge<DistType> *p = NodeTable[i].adj;
	 while ( p != NULL ) 							//循环删除
	   {	NodeTable[i].adj = p->link;  delete p;  p = NodeTable[i].adj; }
   }
   delete [ ] NodeTable;								//删除顶点数组
}

template <class NameType, class DistType>
int Graph<NameType, DistType>::GetVertexPos( const NameType & vertex )
{
	if(NumVertices>=0){
		for ( int i=0; i< NumVertices; i++) {
			if ( NodeTable[i].data == vertex ) return i;
		}
	}

   return -1;
}
template <class NameType, class DistType> int Graph<NameType, DistType>::GetFirstNeighbor ( const int v ) {
//给出顶点位置为v的第一个邻接顶点的位置, 如果找不到, 则函数返回-1。
   if ( v>=0 ) {							//v存在
	 Edge<DistType> *p = NodeTable[v].adj;				//边链表第一个结点地址
	 if ( p != NULL ) return p->dest;				//有, 返回该边另一个顶点
   }
   return -1;								//没有边
}

template <class NameType, class DistType>
int Graph<NameType, DistType>::GetNextNeighbor ( const int v1, const int v2 ) {
//给出顶点v1的某邻接顶点v2的下一个邻接顶点的位置, 若没有下一个邻接顶点, 则函数返回-1。
   if ( v1!=-1) {									//v1存在
	 Edge<DistType> *p = NodeTable[v1].adj;				//边链表第一个结点地址
	 while ( p != NULL ) {							//寻找第v2个邻接顶点
	   if ( p->dest == v2 && p->link != NULL ) return p->link->dest;
	   else p = p->link;
	 }
   }
   return -1;
}

template <class NameType, class DistType>
DistType Graph<NameType, DistType>::GetWeight ( const int v1, const int v2) {
//函数返回边(v1, v2)上的权值, 若该边不在图中, 则函数返回权值0。
   if ( v1 != -1 && v2 != -1 ) {
	 Edge<NameType,DistType> *p = NodeTable[v1].adj;				//边链表头指针
	 while ( p != NULL ) {
	   if ( p->dest == v2 ) return p->cost;				//找到此边, 返回权值
	   else p = p->link;							//否则找下一条边
	 }
   }
   return 0;										//边不在图中
}


template <class NameType, class DistType>
void  Graph<NameType, DistType>::InsertEdge ( const int v1, const int v2, const DistType weight ){
	
	static Edge<DistType> *p,*temp1,*temp2;
	temp1=new Edge<DistType>;
	temp2=new Edge<DistType>;
	temp1->cost=weight;
	temp2->cost=weight;
	temp1->dest=v2;
	temp2->dest=v1;
	if(NodeTable[v1].adj==NULL){
		cout<<"yunxing zheli :"<<endl;
		NodeTable[v1].adj=temp1;
	}
	else{
		p=NodeTable[v1].adj;
		while (p->link!=NULL) {
			p=p->link;
			
		}
		p->link=temp1;
	}
	if(NodeTable[v2].adj==NULL){
		NodeTable[v2].adj=temp2;
	}
	else{
		p=NodeTable[v2].adj;
		while (p->link!=NULL) {
			p=p->link;
			
		}
		p->link=temp2;
	}
	delete p;

}

template <class NameType, class DistType>
void  Graph<NameType, DistType>::InsertVertex ( const NameType & vertex ){
	++NumVertices;
	NodeTable[NumVertices-1].data=vertex;
	NodeTable[NumVertices-1].adj=NULL;
}
template <class NameType, class DistType>
void  Graph<NameType, DistType>::OutPut(){
	for (int i=0;i<NumVertices;i++) {
		cout<<"This is the vetex:"<<endl;
		cout<<NodeTable[i].data<<endl;
		
	}
}
template <class NameType, class DistType> void Graph<NameType, DistType>::BFS (  int v ) {
		//从顶点v出发, 以广度优先的次序横向搜索图, 算法中使用了一个队列。
	int *visited = new int[NumberOfVertices()];                  		//visited记录顶点是否访问过
	for ( int i=0; i<NumberOfVertices(); i++ ) visited[i] = 0;			//初始化
	cout<<endl<<"This is the BFS:"<<endl;
	cout << GetValue (v) << ' ';	
	visited[v] = 1;			//首先访问顶点v, 做已访问标记
	Queue<int> q;								//q是实现分层访问的队列
	q.EnQueue (v);								//顶点v进队列
	while ( !q.IsEmpty ( ) ) {
		v = q.DeQueue ( );							//从队列中退出顶点v
		int w = GetFirstNeighbor (v);					//找顶点v的第一个邻接顶点
		while ( w != -1 ) {							//w是v的邻接顶点
			if ( !visited[w] ) {						//若未访问过
				cout << GetValue (w) << ' ';  visited[w] = 1;		//访问顶点w
				q.EnQueue (w);						//顶点w进队列
			}
			w = GetNextNeighbor (v, w);					//找顶点v的下一个邻接顶点}
		}
	}
	cout<<endl;
		delete [ ] visited;
}
template <class NameType, class DistType> void Graph<NameType, DistType>::OutPutEach(){
	Edge<DistType> *p;
	for (int i=0;i<NumberOfVertices ( );i++) {
		p=NodeTable[i].adj;
		cout<<"this is the    "<<i<<"th link:"<<endl;
		if(p!=NULL) {
			cout<<NodeTable[i].data<<endl;
		}

		while(p!=NULL){
			cout<<GetValue(p->dest)<<endl;
			p=p->link;
			
		}
	}
}