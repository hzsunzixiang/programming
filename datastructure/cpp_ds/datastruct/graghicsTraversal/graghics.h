#include"SeqList.h"
const int MaxNumEdges = 50;							//最大边数
const int MaxNumVertices=10;							//最大顶点数

template <class NameType, class DistType> class Graph {			//图的类定义
private:
   SeqList<NameType> VerticesList;//(5);			//顶点表
   DistType Edge[MaxNumVertices][MaxNumVertices];			//邻接矩阵
   int CurrentEdges;								//当前边数
   int CurrentVertices;
  //int FindVertex ( SeqList<NameType> & L, const NameType & vertex )
   // { return L.Find (vertex); }     //在顶点表L中搜索顶点vertex
   //int GetVertexPos ( const NameType & vertex )
    //{ return FindVertex (VerticesList, vertex ); }
     //给出顶点vertex在图中的位置
public:
   //SeqList<NameType> VerticesList(MaxNumVertices);			//顶点表
	//SeqList<NameType> VerticesList(3);
   Graph ( const int sz);					//构造函数	
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
  // void Kruskal ( MinSpanTree &T );
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
template <class NameType, class DistType> void Graph< NameType, DistType>::InitGraph(){	
	for (int m=0;m<CurrentVertices;m++) 
		for (int n=0;n<CurrentVertices;n++) {
				Edge[m][n]=0;
		}
		int num,i,j;
		cout<<"Input the number of edge:"<<endl;
		cin>>num;
		cout<<"Input the edge:"<<endl;
		for(int k=0;k<num;k++){
			cin>>i>>j;
			Edge[i][j]=1;
			if(k!=(num-1)) cout<<"continue:"<<endl;
		}
	for ( i=1;i<CurrentVertices;i++) 
		for ( j=0;j<i;j++) {
			Edge[i][j]=Edge[j][i];
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


/*template <class NameType, class DistType> 
NameType Graph<NameType, DistType>::GetFirstNeighbor ( const int v ) {
//给出顶点位置为v的第一个邻接顶点的位置, 如果找不到, 则函数返回-1。
   if ( v != -1 ) {
	 for ( int col=0; col<VerticesList.Length(); col++ ) if ( Edge[v][col] > 0 ) return VerticesList.Get(col);
   }
   return -1;
};*/
template <class NameType, class DistType> 
int Graph<NameType, DistType>::GetFirstNeighbor ( const int v ) {
//给出顶点位置为v的第一个邻接顶点的位置, 如果找不到, 则函数返回-1。
   if ( v != -1 ) {
	 for ( int col=0; col<VerticesList.Length(); col++ ) if ( Edge[v][col] > 0 ) return col;
   }
   return -1;
};
/*template <class NameType, class DistType>
NameType Graph<NameType, DistType>::GetNextNeighbor ( const int v1, const int v2 ) {
//给出顶点v1的某邻接顶点v2的下一个邻接顶点
   if ( v1 != -1 && v2 != -1 )
   {
     for ( int col=v2+1; col<VerticesList.Length(); col++ )
       if ( Edge[v1][col] > 0 ) return VerticesList.Get(col);
   }
   return -1;
};*/
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
/*template <class NameType, class DistType>istream& operator >>(istream& is, Graph<NameType,DistType>& g)
{
   int n,e,k,j;
   NameType head,tail,name;
   DistType weight;
   is >> n;										//输入顶点个数
   for ( int i=0; i<n; i++)
   {
     is >> name;
     g.InsertVertex ( name );
   }		//依次输入顶点, 插入图中

   is >> e;										//输入边数

   for ( i=0; i<e; i++) {								//依次输入边信息
	 is >> tail >> head >> weight;						//输入各边
	 k = g.GetVertexPos ( tail );  j = g.GetVertexPos ( head );			//取两顶点位置
	 g.InsertEdge ( k, j, weight );							//插入图中
   }
   return is;

}*/

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