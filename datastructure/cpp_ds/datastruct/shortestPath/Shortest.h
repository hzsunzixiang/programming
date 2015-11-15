

const int NumVertices =10;				//图中最大顶点个数
const int MAXINT=32767;
class Graph {						//图的类定义
private:
	int Edge[NumVertices][NumVertices];		//图的邻接矩阵
	int dist[NumVertices];		//图的邻接矩阵
	int path[NumVertices];		//图的邻接矩阵
	int S[NumVertices];
	int CurrentVertices;
public:
	   Graph ( );
	   Graph ( const int sz);	
	   void InitGraph();
	   void ShortestPath ( int n, int v) ;
	   void Output(const int num);
};
Graph::Graph ( ) {
	//构造函数
	InitGraph();
};
Graph::Graph (const int sz) {
	//构造函数
	CurrentVertices=sz;
	InitGraph();
};
void Graph::InitGraph(){	
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
void Graph::ShortestPath (  int n,int v) {
	//G是一个具有n个顶点的带权有向图, 各边上的权值由Edge[i][j]给出。本算法建立起一个数组: dist[j], 0 < j < n,
	//是当前求到的从顶点v到顶点j的最短路径长度, 同时用数组path[j],	0 < j < n, 存放求到的最短路径。
	// assert(((v<n) &&(v>=0)));
	for ( int i=0; i<n; i++) {				// dist和path数组初始化
		dist[i] = Edge[v][i];					//邻接矩阵第v行元素复制到dist中
		S[i] = 0;						//已求出最短路径的顶点集合初始化
		if ( i != v && dist[i] < MAXINT ) path[i] = v;
		else path[i] = -1;					//路径存放数组初始化
	}
	S[v] = 1;  dist[v] = 0;					//顶点v加入顶点集合
	for ( i=0; i<n-1; i++ ) {				//从顶点v确定n-1条路径
		int min = MAXINT;
		int u = v;
		for ( int j=0; j<n; j++ )				//选择当前不在集合S中具有最短路径的顶点u
			if ( !S[j] && dist[j] < min ) { u = j;  min = dist[j]; }
			S[u] = 1;						//将顶点u加入集合S, 表示它已在最短路径上
			for ( int w=0; w<n; w++ )			//修改
				if ( !S[w] && Edge[u][w] < MAXINT && dist[u] + Edge[u][w] < dist[w] ) {
					dist[w] = dist[u] + Edge[u][w];  path[w] = u;
				}
	}
	//////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////
	

}
void Graph::Output(const int num){//输出顶点 num到 顶点0的值
	cout<<"the shortest path is:";
	int a;
	cout<<endl<<num<<endl;
	a=path[num];
	while (a!=0) {
		cout<<a<<endl;
		a=path[a];
	}
	cout<<0<<endl;
	cout<<"the shortest value of the path is:"<<endl;
	cout<<dist[num]<<endl;

	}