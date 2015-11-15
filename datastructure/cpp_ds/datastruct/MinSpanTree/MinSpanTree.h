#include"SeqList.h"
#include "heap.h"
#include "UFSet.h"
const int MaxNumEdges = 50;							//最大边数
const int MaxNumVertices=10;							//最大顶点数
const int MAXINT=32767;

template <class NameType, class DistType> class Graph {			//图的类定义
private:
   SeqList<NameType> VerticesList;//(5);			//顶点表
   DistType Edge[MaxNumVertices][MaxNumVertices];			//邻接矩阵
   int CurrentEdges;								//当前边数
   int CurrentVertices;
public:
   Graph ( const int sz=MaxNumVertices);					//构造函数	
   void InitGraph();
   int GraphEmpty ( ) const { return VerticesList.IsEmpty ( ); }		//判图空否
   int GraphFull ( ) const { return VerticesList.IsFull ( ) || CurrentEdges ==MaxNumEdges; }
   int NumberOfVertices ( ) { return VerticesList.Length(); }		//返回当前顶点数
   int NumberOfEdges ( ) { return CurrentEdges; }				//返回当前边数
   NameType GetValue ( const int i )						//取顶点i的值, i不合理则返回空
      { return VerticesList.Get(i); }
   DistType GetWeight ( const int v1, const int v2 );		//给出以顶点v1和v2为两端点的边上的权值
   int GetFirstNeighbor ( const int v );				//给出顶点位置为v的第一个邻接顶点的位置
   int GetNextNeighbor ( const int v1, const int v2 );		//给出顶点位置v1的某邻接顶点v2的下一个邻接顶点
   void InsertVertex (  NameType & vertex );		//插入一个顶点vertex, 该顶点没有入边
   void InsertEdge ( const int v1, const int v2, DistType weight );	//插入一条边(v1, v2), 该边上的权值为weight
   void RemoveVertex ( const int v );				//在图中删去顶点vertex和所有与它相关联的边
   void RemoveEdge ( const int v1, const int v2 );		//在图中删去边(v1,v2)
  // void Prim ( MinSpanTree &T ) ;
   void Kruskal ();
   friend istream& operator >>(istream& , Graph&);
   void DFS ();
   void BFS(int v);
   void DFS ( const int v, int visited[]) ;
};

template <class NameType, class DistType> Graph<NameType, DistType>::Graph ( const int sz ) {
//构造函数
	CurrentVertices=sz;
	for (int i=0;i<sz;i++) {
		//VerticesList.Insert(char(65+i));
		VerticesList.Insert(i);
	}
	VerticesList.Output();
	InitGraph();
};
template <class NameType, class DistType> void Graph<NameType, DistType>::InitGraph(){	
	for (int m=0;m<CurrentVertices;m++) 
		for (int n=0;n<CurrentVertices;n++) {
			Edge[m][n]=MAXINT;
		}
		for ( m=0;m<CurrentVertices;m++) 
		{
			Edge[m][m]=0;
		}
		int num,i,j,cost;
		cout<<"Input the number of edge:"<<endl;
		cin>>num;
		cout<<"Input the edge start end and cost :"<<endl;
		for(int k=0;k<num;k++){
			cin>>i>>j>>cost;
			Edge[i][j]=cost;
			if(k!=(num-1)) cout<<"continue:"<<endl;
		}	
		cout<<"the matrix is :"<<endl;
		for (int m1=0;m1<CurrentVertices;m1++) 
			for (int n1=0;n1<CurrentVertices;n1++) {
				cout<<Edge[m1][n1]<<" ";
				if (n1==CurrentVertices-1) { cout<<endl;}
			}
}

template <class NameType, class DistType>
DistType Graph<NameType, DistType>::GetWeight ( const int v1, const int v2 ) 
{
//给出以顶点v1和v2为两端点的边上的权值
   if ( v1 != -1 && v2 != -1 ) return Edge[v1][v2];
   else return NULL;							//带权图中权值为0, 表示无权值
};

template <class NameType, class DistType> 
int Graph<NameType, DistType>::GetFirstNeighbor ( const int v ) {
//给出顶点位置为v的第一个邻接顶点的位置, 如果找不到, 则函数返回-1。
   if ( v != -1 ) {
	 for ( int col=0; col<VerticesList.Length(); col++ ) if ( Edge[v][col] > 0 ) return col;
   }
   return -1;
};
template <class NameType, class DistType>
int Graph<NameType, DistType>::GetNextNeighbor ( const int v1, const int v2 ) {
//给出顶点v1的某邻接顶点v2的下一个邻接顶点
   if ( v1 != -1 && v2 != -1 )
   {
     for ( int col=v2+1; col<VerticesList.Length(); col++ )
       if ( Edge[v1][col] > 0 ) return col;
   }
   return -1;
};

template <class NameType, class DistType>
void Graph<NameType, DistType>::InsertVertex (  NameType & vertex )		//插入一个顶点vertex, 该顶点没有入边
{
	assert (VerticesList.Insert ( vertex, VerticesList.Length() ));		
};

template <class NameType, class DistType>
void Graph<NameType, DistType>:: InsertEdge ( const int v1, const int v2, DistType weight )	//插入一条边(v1, v2), 该边上的权值为weight
{
	CurrentEdges++;
	Edge[v1][v2]=weight;
};

template <class NameType, class DistType> void Graph< NameType, DistType>::DFS ( ) {						//对连通图进行深度优先搜索的主过程
	int *visited = new int [NumberOfVertices()];					//创建辅助数组
	for ( int i=0; i<NumberOfVertices(); i++ ) visited [i] = 0;			//辅助数组初始化
	cout<<"This is the DFS"<<endl;
	DFS(0,visited);								//从顶点0开始深度优先搜索
	delete [ ] visited;
};
template <class NameType, class DistType>void Graph< NameType, DistType>::DFS (const int v, int visited []){		//子过程
		//从顶点位置v出发, 以深度优先的次序访问所有可读入的尚未访问过的顶点。算法中用到一个辅助数组
		// visited, 对已访问过的顶点作访问标记。
	cout << GetValue (v) << ' ';					//访问该顶点的数据
	visited[v] = 1;							//访问标志改为已访问过
	int w = GetFirstNeighbor (v);					//找顶点v的第一个邻接顶点w
	while ( w != -1 ) {						//有邻接顶点
		if ( !visited[w] ) {
			DFS ( w, visited );			//若未访问过, 从w递归访问
		}
		w = GetNextNeighbor ( v, w );				//找顶点v的下一个邻接顶点
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

template <class NameType, class DistType>void Graph< NameType, DistType>::Kruskal () {	//克鲁斯卡尔算法
	EdgeNode e;
	int VerticesNum=NumberOfVertices();
	int count;
	MinHeap<EdgeNode> H(VerticesNum );	//最小堆
	int NumVertices = VerticesList.Length();			//图中顶点个数
	UFSet F (NumVertices);			//连通分量
	cout<<"The edges of the  min span tree:"<<endl;
	for ( int u=0; u<NumVertices; u++ ) 			//建立最小堆的数据
		for ( int v=u+1; v<NumVertices; v++ )
			if ( Edge[u][v]!= 0 &&Edge[u][v]!=MAXINT) {		//插入新边值结点到最小堆中
				e.tail=u;e.head=v;e.cost=Edge[u][v];
				H.Insert (e);
			}
			count = 1;					//生成树边计数
			while ( count < NumVertices ) {			//反复执行, 取n-1条边
				H.RemoveMin (e );				//从最小堆中退出具最小权值的边
				int u = F.FindFather( e.tail );
				int v = F.FindFather( e.head );			//取两顶点所在集合的根
				if ( u != v ) {				//不是同一集合, 说明不连通
					F.Unite ( u, v );
					count++;	//合并, 连通它们, 该边加入生成树
					cout<<"("<<e.head<<","<<e.tail<<","<<e.cost<<")"<<"      ";
				}
			}
}
