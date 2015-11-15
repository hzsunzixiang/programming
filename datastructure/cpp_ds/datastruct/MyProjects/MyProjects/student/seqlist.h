template <class type>class seqlist
{
private:
   type *data;              //顺序表的存放数组
   int  maxsize;           //顺序表的最大可容纳项数
   int  last;                  //当前已存表项的最后位置
public:
    seqlist(int maxsize);
    ~seqlist(){delete[] data;}
    int  length()const {return last+1;}   //计算表长
    void  create(int i);
    int find (type &x) const;                //定位函数：找x在表中的位置
    int  isin (type &x);                        //判断X在表中，与find()有区别
	int getlast(){return last;};
    type getdata(int i){return i<0||i>last?NULL:data[i];}//取数据
    int insert(type x,int i);                       //在表中第i个位置处插入X
    int remove(type &x);               //删除X
    int next(){return current<last?&data[++current]:NULL;} //找x的后继
    int prior(){return current>0?&data[--current]:NULL;}  //找出x的前驱
    int isempty(){return last = = -1;}  // 判空
    int isfull(){return last==maxsize-1;}  // 判满
};
template<class type> seqlist<type>::seqlist(int sz)
{
    if (sz>0)
       {  maxsize=sz;last=-1;
           data=new type[maxsize];
           if (data==NULL)
              {cerr<<"内存溢出"<<endl;exit(1);}
         }
}
template<class type>int seqlist<type>::find(type &x)const 
{ 
	int i=0;
	while(i<=last&&data[i]!=x) i++;
	if(i>last) return -1;
	else return i;
}
template<class type>int  seqlist<type>::insert(type x,int i)
{
	if(i<0||i>last+1||last==maxsize-1) return 0;
	else
	{
		last++;
		for(int j=last;j>i;j--) data[j]=data[j-1];
		data[i]=x;return 1;
	}
}
template<class type>void seqlist<type>::create(int i)
{
	type x;
	for(int j=0;j<i;j++)
	{
		cout<<"这是第"<<j+1<<"个"<<endl;
		cin>>x;
		data[j]=x;
		last++;
	}
}
template<class type >int  seqlist<type>::remove(type &x)
{
    int  i=find(x);
    if(i>=0)
	{
	last--;
      for(int j=i;j<=last;j++)data[j]=data[j+1];
     return 1;
      }
   return   0;
}
template<class type >int seqlist<type>::isin(type &x){
	int i=0,found=0;
	while(i<=last&&!=found)
		if(data[j]!=x) i++;
		else found=1;
	return found;
}