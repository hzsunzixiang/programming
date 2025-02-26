
template <class Type> class MinPQ {
  public:
    virtual int Insert ( const Type & ) = 0;
    virtual int RemoveMin ( Type & ) = 0;
  };

class EdgeNode
{			//最小生成树边结点的类声明
public:
	//friend ostream& operator <<(ostream& strm, MSTEdgeNode e);
	int tail, head;				//两顶点位置
	int cost;					//边上的权值
};
template <class Type> class MinHeap : public MinPQ<Type> {
  public:
	MinHeap ();
    MinHeap ( int maxSize );
    MinHeap ( Type arr[ ], int n );
    ~MinHeap ( ) { delete [ ] heap; }
    const MinHeap<Type> & operator = ( const MinHeap<Type> &R );
    int Insert ( const Type &x );
    int RemoveMin ( Type &x );
    int IsEmpty ( ) const { return CurrentSize == 0; }
    int IsFull ( ) const { return CurrentSize == MaxHeapSize; }
    void MakeEmpty ( ) { CurrentSize = 0; }
    void PrintHeap();
	void Filter();
  private:
    enum { DefaultSize =10};
    Type *heap;
    int CurrentSize;
    int MaxHeapSize;
    void FilterDown ( int i, int m );
    void FilterUp ( int i );
	};

  template <class Type> MinHeap<Type>::MinHeap ( int maxSize ) {
    MaxHeapSize = DefaultSize < maxSize ? maxSize : DefaultSize;
    heap = new Type [MaxHeapSize];
    CurrentSize = 0;
    }
    template <class Type> MinHeap<Type>::MinHeap () {
		int num,i;
        cout<<"Input the number of heap:"<<endl;
		cin>>num;
		CurrentSize = num;   
		heap = new Type [num];
		cout<<"Input the element:"<<endl;
		for(int k=0;k<num;k++){
			cin>>i;
			heap[k].cost=i;
			if(k!=(num-1)) cout<<"continue:"<<endl;
		}
	}	
  template <class Type> MinHeap<Type>::MinHeap ( Type arr[ ], int n ) {
    MaxHeapSize = DefaultSize < n ? n : DefaultSize;
    heap = new Type [MaxHeapSize];
    for(int i=0;i<=n;i++) heap[i]=arr[i];
    CurrentSize = n+1;               //n is arr's maximum index.
    int currentPos = (CurrentSize-2)/2;
    while ( currentPos >= 0 ) {
      FilterDown ( currentPos, CurrentSize-1 );
      currentPos--;
      }
   }


  template <class Type> void MinHeap<Type>::FilterDown ( int start, int EndOfHeap ) {
    int i = start,   j = 2*i+1;	Type temp = heap[i];
    while ( j <= EndOfHeap ) {
      if ( j < EndOfHeap && heap[j].cost > heap[j+1].cost) j++;
      if ( temp.cost<= heap[j].cost) break;
	else {
	heap[i]= heap[j];
	i = j;
	j = 2*j+1; }
      }
    heap[i] = temp;
    }
template <class Type> void MinHeap<Type>::Filter() {
	int currentPos = (CurrentSize-2)/2;
    while ( currentPos >= 0 ) {
      FilterDown ( currentPos, CurrentSize-1 );
      currentPos--;
      }

}
  template <class Type> void MinHeap<Type>::FilterUp ( int start ) {
    int j = start,  i = (j-1)/2;   Type temp = heap[j];
    while ( j > 0 ) {
      if ( heap[i].cost <= temp.cost ) break;
	else {  heap[j] = heap[i];  j = i;  i = (i -1)/2; }
		   }
    heap[j] = temp;
    }


  template <class Type> int MinHeap<Type>::Insert ( const Type &x ) {
    if ( CurrentSize == MaxHeapSize ) {
    cerr << "Heap Full" << endl;
     return 0;
      }
    heap[CurrentSize] = x;
    FilterUp (CurrentSize);
    CurrentSize++;
    return 1;
  }


  template <class Type> int MinHeap<Type>::RemoveMin ( Type &x ) {    //return the minimum through the reference of x.
    if ( !CurrentSize ) { cout << "Heap empty" << endl;  return 0; }
    x = heap[0];
    heap[0] = heap[CurrentSize-1];
    CurrentSize--;
    FilterDown ( 0, CurrentSize-1 );
    return 1;
   }

  template<class Type> void MinHeap<Type>::PrintHeap(){
	  cout<<"The heap after coordinated:"<<endl;
    for(int i=0;i<CurrentSize;i++)
    cout<<heap[i].cost<<endl;
    }

