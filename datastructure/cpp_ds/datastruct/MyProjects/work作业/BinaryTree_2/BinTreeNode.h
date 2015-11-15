#include <iostream.h>
#include <stdlib.h>
class BinaryTree;
class BinTreeNode {
friend class BinaryTree;
public:
    BinTreeNode ( ) : leftChild (NULL),rightChild (NULL) { }
    BinTreeNode (int item, BinTreeNode *left = NULL,BinTreeNode *right = NULL) :data(item),leftChild (left),rightChild(right) { }
private:
    BinTreeNode *leftChild, *rightChild;   //左、右子女   
    int data;   //数据域
	int GetData () const { return data; } //取得结点的数据
    BinTreeNode *GetLeft ( ) const{ return leftChild; } //取得结点左子女指针值    
	BinTreeNode *GetRight( ) const{ return rightChild; } //取得结点右子女指针值
    void SetData ( const int & item ){ data = item; }//修改结点数据值
    void SetLeft ( BinTreeNode  *L ){ leftChild = L; }	//修改结点左子女指针值
    void SetRight ( BinTreeNode *R ){ rightChild = R; } //修改结点右子女指针值
};
class BinaryTree {
public:
    BinaryTree ( ) : root (NULL) { }//构造函数
    BinaryTree ( int value ) : RefValue (value), root (NULL) { }
    ~BinaryTree ( ) { destroy ( root ); }//析构函数
    void Insert(BinTreeNode *&current,int &item);//插入函数	
	void remove();//结点删除
	void destroy(BinTreeNode *current);
	void inorder(){inorder(root);}//中序遍历
	void preorder(){preorder(root);}//前序遍历
	void postorder(){postorder(root);}//后序遍历
	void find();//查找结点的内存地址
	void size(){ cout<<"the number of nodes of the  binarytree："<<size(root)<<endl;}//求总的结点数
	void height(){cout<<"the height of the binary tree："<<height(root)<<endl;}//求树的高度
	void LeafNode(){cout<<"the number of the leafnodes of the binary tree："<<LeafNode(root)<<endl;}//求树的叶结点
	friend istream &operator >> ( istream &in, BinaryTree  &Tree ) ;
    friend ostream &operator << ( ostream &out,BinaryTree  &Tree );
	int min(){return min(root)->data;}//求小者
	int Max(int a,int b){return a>b?a:b;}//求两着较大着
	BinTreeNode *Parent (BinTreeNode  *current ){ return root == NULL || root == current?NULL : Parent ( root, current ); }//返回双亲结点地址
	void Insert ( int item );
	void Sum();
	int Sum(BinTreeNode *current);
private:
    BinTreeNode  *root;//二叉树的根指针
    int RefValue;//数据输入停止标志，仅用于输入
	void inorder(BinTreeNode *current);
	void preorder(BinTreeNode *current);
	void postorder(BinTreeNode *current);
	int size(BinTreeNode *current);
	int height(BinTreeNode *current);
	int LeafNode(BinTreeNode *current);
	BinTreeNode *find(int item,BinTreeNode *current);
	BinTreeNode *min(BinTreeNode *current);
	void remove(int item,BinTreeNode *&current);  
	BinTreeNode *Parent ( BinTreeNode *start,BinTreeNode *current );
	void Traverse ( BinTreeNode *current,ostream &out ) const;
};
void BinaryTree:: destroy ( BinTreeNode *current ) {
    if ( current != NULL ) {
       destroy ( current->leftChild );
       destroy ( current->rightChild );
       delete current;
    }
}
void BinaryTree::inorder(BinTreeNode *current)
{
	if(current!=NULL)
	{
		inorder(current->leftChild);
		cout<<current->data<<" ";
		inorder(current->rightChild);
	}
}
void BinaryTree::preorder(BinTreeNode *current)
{
	if(current!=NULL)
	{
		cout<<current->data<<" ";
		inorder(current->leftChild);
		inorder(current->rightChild);
	}
}
void BinaryTree::postorder(BinTreeNode *current)
{
	if(current!=NULL)
	{
		inorder(current->leftChild);
		inorder(current->rightChild);
		cout<<current->data<<" ";
	}
}
void BinaryTree::Traverse(BinTreeNode *current, ostream &out ) const {
    if ( current != NULL ) {					       
        out << current->data << ' ';//输出current的数据
        Traverse ( current->leftChild, out );//搜索并输出其左子树
        Traverse ( current->rightChild, out ); //搜索并输出其右子树
    }
}
void BinaryTree::Insert ( int item )
{
	if(root==NULL)
	{
		root=new BinTreeNode(item);
		if(root==NULL)
		{
			cout<<"out of space!"<<endl;
			exit(1);
		}
	}
	else if(item<=root->data) Insert(root->leftChild,item);
	else if(item>root->data) Insert(root->rightChild,item);
}
void BinaryTree::Insert(BinTreeNode *&current,int &item)
{	
	if(current==NULL)
	{
		current=new BinTreeNode(item);
		if(current==NULL)
		{
			cout<<"out of space!"<<endl;
			exit(1);
		}
	}
	else if(item<current->data) Insert(current->leftChild,item);
	else if(item>current->data) Insert(current->rightChild,item);
}
void BinaryTree::remove(int x,BinTreeNode *&current)
{
	BinTreeNode *temp;
	if(current!=NULL)
		if(x<current->data) remove(x,current->leftChild);
		else if(x>current->data) remove(x,current->rightChild);
		else if(current->leftChild!=NULL&&current->rightChild!=NULL)
		{
			temp=min(current->rightChild);
			current->data=temp->data;
			remove(current->data,current->rightChild);
		}
		else
		{
			temp=current;
			if(current->leftChild==NULL) current=current->rightChild;
			else if(current->rightChild==NULL) current=current->leftChild;
			delete temp;
		}
}
void BinaryTree::remove()
{
	int item;
	cout<<"the node you want to remove：";
	cin>>item;
	remove (item,root);
	cout<<endl;
}
void BinaryTree::find()
{
	int item;
	cout<<"the number you want to find :";
	cin>>item;
	cout<<"the address of the node："<<find(item,root)<<endl;
	if(find(item,root)!=NULL) cout<<"search success！"<<endl;
	   else cout<<"search failing！"<<endl;
}
BinTreeNode * BinaryTree::find(int item,BinTreeNode *current)
{
	if(current==NULL)
		return NULL;
	else if(item<current->data) return find(item,current->leftChild);
	else if(item>current->data) return find(item,current->rightChild);
	else return current;
}
int BinaryTree::size(BinTreeNode *current)
{
	if(current==NULL)
		return 0;
	else
		return 1+size(current->leftChild)+size(current->rightChild);
}
int BinaryTree::height(BinTreeNode *current)
{
    if(current==NULL)return -1;
	else return 1+Max(height(current->leftChild),height(current->rightChild));
}
int BinaryTree::LeafNode(BinTreeNode *current)
{
	if(current==NULL) return 0;
	if(current->leftChild!=NULL||current->rightChild!=NULL) 
     return LeafNode(current->leftChild )+LeafNode(current->rightChild);
    else return 1;
}
BinTreeNode * BinaryTree:: Parent ( BinTreeNode * start, BinTreeNode  *current ) {
     if ( start == NULL ) return NULL;
     if ( start->leftChild == current ||start->rightChild == current )		//找到
		 return start;	
     BinTreeNode *p;	//否则
     if ( ( p = Parent ( start->leftChild, current ) )!= NULL ) return p;	//在左子树中搜索
     else return Parent ( start->rightChild, current );//在右子树中搜索
}
istream & operator >>( istream & in, BinaryTree &Tree ) {
     int item;
     cout << "Construct a binary tree: \n ";			    
     cout <<"Input data (end with" << Tree.RefValue << " ): ";
     in >> item;		//输入				
     while ( item != Tree.RefValue ) {			
		Tree.Insert ( item );
         	cout << " Input data (end with" << Tree.RefValue<<":)"; 
            in >> item;
    }
    return in;
}
ostream & operator <<( ostream & out, BinaryTree &Tree ) {
     out << "二叉树的前序遍历.\n";
     Tree.Traverse ( Tree.root, out );
     out << endl;
     return out;
}
BinTreeNode *BinaryTree::min(BinTreeNode *current)
{
	for(;current->leftChild!=NULL;)
		current=current->leftChild;
	return current;
}
int BinaryTree::Sum(BinTreeNode *current){
	int sum=0;
	 if ( current!= NULL ) {					       
        sum=sum+current->data;//输出current的数据
        sum=Sum( current->leftChild)+sum;//搜索并输出其左子树
        sum=Sum( current->rightChild)+sum; //搜索并输出其右子树
	 }	 
	 return sum;
}
void BinaryTree::Sum(){
	cout<<Sum(root)<<endl;
}

