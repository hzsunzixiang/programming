//#include<iostream.h>

const int MAX = 20; //集合的最大成员数量

class UFSet{ //并查集类

public:
	UFSet(int s = MAX); //构造函数
	UFSet(const UFSet & obj); //拷贝构造函
	~UFSet() //析构函
	{
		delete []father;
	}

	UFSet & operator = (const UFSet & obj); //赋值函数

	int FindFather(int pos); //寻找序号pos的族长大人

	bool Unite(int posI, int posJ);//将成员posI和posJ合并到同一个家族

	int FindFatherAndReducePath(int pos); //查找族长并压缩路径

	bool UnionBySize (int posI, int posJ); //按大小求并

	bool SameFamily(int posI, int posJ); //判断成员posI和posJ是否属于同一家族

	void PrintUFSet();
	int* FindRoot();
	void Print();
private:
	int *father; //并查集成员数组，存放各元素的父亲结点
	int size; //并查集成员数量
	int *vec;
	int counter;
};
UFSet::UFSet(int s) : size(s) //构造函数
{
	father = new int[size];
	for (int i=0; i<size; i++) //所有的数组元素值均初始化为-1
		father[i] = -1;
}
UFSet::UFSet(const UFSet & obj) //拷贝构造函数
{
	size = obj.size;
	father = new int[size + 1];
	for (int i=0; i<=size; i++)
		father[i] = obj.father[i];
}
UFSet & UFSet::operator = (const UFSet & obj) //赋值函数
{
	if (this == &obj) //检查自赋值
		return *this;
	delete []father; //释放原有的内存资源
	size = obj.size; //分配新的内存资源，并复制内容
	father = new int[size + 1];
	for (int i=0; i<=size; i++)
		father[i] = obj.father[i];
	return *this; //返回本对象的引用
}

int UFSet::FindFather(int pos)//寻找序号pos的族长大人。若pos本身是族长，则返回自身
{
	if (father[pos] < 0)
		return pos;
	return FindFather(father[pos]);
}

bool UFSet::Unite(int posI, int posJ)//将成员posI和posJ合并到同一个家族
{
	//首先各自去寻找自己的族长
	
	int fI = FindFather(posI);
	int fJ = FindFather(posJ);
	if (fI == fJ) //如果是同一个族长门下，不必合并，即合并失败
		return false;
	else
		father[fJ] = fI; //否则fI当族长：谁让posI站在posJ的前面呢!
	return true;
}
int UFSet::FindFatherAndReducePath(int pos)//查找族长并压缩路径
{
	if (father[pos] < 0)
		return pos;
	//若自己不是族长，则找到族长后，将所途经的结点均指向族长
	return father[pos] = FindFatherAndReducePath(father[pos]);
}
bool UFSet::UnionBySize(int posI, int posJ)//按大小求并
{
	//首先各自去寻找自己的族长
	int fI = FindFatherAndReducePath(posI);
	int fJ = FindFatherAndReducePath(posJ);
	if (fI == fJ) //如果是同一个族长门下，不必合并，即合并失败
		return false;
	else if (father[fI] < father[fJ])
	{//如果族长fI的实力比fJ强，即|fI|>|fJ|，则fI当族长，并修改father[fI]和father[fJ]
		father[fI] -= father[fJ];
		father[fJ] = fI;
	}
	else //否则fJ当族长
	{
		father[fJ] -= father[fI];
		father[fI] = fJ;
	}
	return true;
	
}

bool UFSet::SameFamily(int posI, int posJ)//判断成员posI和posJ是否属于同一家族

{
	return FindFatherAndReducePath(posI) == FindFatherAndReducePath(posJ);
	
}
void UFSet::PrintUFSet()//输出集合的所有元素
{
	for (int i=0; i<size; i++)
		cout<<FindFatherAndReducePath(i)<< ' '<<endl;
	cout << endl;
}
int* UFSet:: FindRoot()//查找所有的根节点
{
	int flag=0;
	counter=0;
	vec=new int(size);
	vec[counter]=FindFatherAndReducePath(0);
	for(int i=1;i<size;i++){
			for(int j=0;j<=counter;j++){
				if(FindFatherAndReducePath(i)==vec[j])
					break;
				if(j==counter){
					++counter;
					vec[counter]=FindFatherAndReducePath(i);
				}
			}
	}
	return vec;
}
void UFSet::Print()//输出集合的所有元素
{
    
    FindRoot();

	cout<<"counter:"<<counter<<endl;
	cout<<"root:"<<endl;
	for(int i=0;i<=counter;i++){
		cout<<vec[i]<<endl;
	}
	cout<<"output the equivalence class  :"<<endl;
	for(int m=0;m<=counter;m++)
		for(int n=0;n<size;n++)
		{
			if (FindFather(n)==vec[m])
			{
				cout<<n<<"  ";
			}
			if (n==(size-1))
			{
				cout<<endl;
				}
		}

}