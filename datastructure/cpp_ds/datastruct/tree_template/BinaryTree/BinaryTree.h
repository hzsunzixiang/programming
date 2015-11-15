#include <stdio.h>
#include <iostream.h>
#include <iomanip.h>
template <class Type> class BinaryTree;
template <class Type> class BinTreeNode {
friend class BinaryTree<Type>;
public:
    BinTreeNode ( ) : leftChild (NULL),rightChild (NULL) { }
    BinTreeNode ( Type item, BinTreeNode<Type> *left = NULL,BinTreeNode<Type> *right = NULL ) :data 

(item),leftChild (left), rightChild(right) { }
    Type GetData ( ) const { return data; } //取得结点的数据
    BinTreeNode<Type> *GetLeft ( ) const{ return leftChild; } //取得结点左子女指针值    
	BinTreeNode<Type> *GetRight( ) const{ return rightChild; } //取得结点右子女指针值
    void SetData ( const Type & item ){ data = item; }//修改结点数据值
    void SetLeft ( BinTreeNode <Type> *L ){ leftChild = L; }	//修改结点左子女指针值
    void SetRight ( BinTreeNode <Type> *R ){ rightChild = R; } //修改结点右子女指针值
private:
    BinTreeNode<Type> *leftChild, *rightChild;   //左、右子女   
    Type data;   //数据域
};

template <class Type> class BinaryTree {
public:
    BinaryTree ( ) : root (NULL) { }//构造函数
    BinaryTree ( Type value ) : RefValue (value), root (NULL) { }
	BinaryTree(const BinaryTree<Type> &s){ root=Copy(s.root);}
    ~BinaryTree ( ) { destroy ( root ); }//析构函数
    int IsEmpty ( ) { return root == NULL ? 1 : 0; }//判空
    BinTreeNode <Type> *Copy(BinTreeNode <Type>  *orignode);
    BinTreeNode <Type> *Parent (BinTreeNode <Type> *current ) 
	{ return root == NULL || root == current?NULL : Parent ( root, current ); }//返回双亲结点地址
    BinTreeNode <Type> *LeftChild (BinTreeNode <Type> *current ) //返回左子女结点地址
        { return root != NULL ? current->leftChild : NULL; }
    BinTreeNode <Type> *RightChild (BinTreeNode <Type> *current ) //返回右子女结点地址
        { return root != NULL ? current->rightChild : NULL; }
    void Insert ( const Type & item){Insert(item,root);}//插入新元素
	void input();
    int Find ( const Type &item ) const;//搜索元素
    const BinTreeNode <Type> *GetRoot ( ) const{ return root; }//取根
    friend istream &operator >> ( istream&in, BinaryTree<Type> &Tree ) ;
    friend ostream &operator << ( ostream&out, BinaryTree <Type> &Tree );
private:
    BinTreeNode <Type> *root;//二叉树的根指针
    Type RefValue;//数据输入停止标志，仅用于输入
    BinTreeNode <Type> *Parent ( BinTreeNode <Type> *start,BinTreeNode <Type> *current );
    void Insert ( const Type &item,BinTreeNode<Type> * &current); 
    void Traverse ( BinTreeNode<Type> *current,ostream &out ) const;
    int Find ( BinTreeNode<Type> *current, const Type &item ) const ;
    void destroy(BinTreeNode<Type> *current);
};
template<class Type> BinTreeNode <Type> * BinaryTree<Type>::Copy(BinTreeNode <Type>  *orignode){
	if(orignode==NULL) return NULL;
	BinTreeNode<Type> *temp=new BinTreeNode<Type>;
	temp->data=orignode->data;
	temp->leftChild=Copy(orignode->leftChild);
	temp->rightChild=Copy(orignode->rightChild);
	return temp;
}
template<class Type> void BinaryTree<Type>:: destroy ( BinTreeNode<Type> *current ) {
    if ( current != NULL ) {
       destroy ( current->leftChild );
       destroy ( current->rightChild );
       delete current;
    }
}
template <class Type> BinTreeNode <Type> * BinaryTree <Type> :: Parent ( BinTreeNode<Type> * start, BinTreeNode 

<Type> *current ) {
     if ( start == NULL ) return NULL;
     if ( start->leftChild == current ||start->rightChild == current )		//找到
		 return start;	
     BinTreeNode <Type> *p;	//否则
     if ( ( p = Parent ( start->leftChild, current ) )
            != NULL ) return p;	//在左子树中搜索
     else return Parent ( start->rightChild, current );//在右子树中搜索
}
template <class Type> void BinaryTree<Type> :: Traverse ( 
BinTreeNode <Type> *current, ostream &out ) 
const {
    if ( current != NULL ) {					       
        out << current->data << ' ';//输出current的数据
        Traverse ( current->leftChild, out );//搜索并输出其左子树
        Traverse ( current->rightChild, out ); //搜索并输出其右子树
    }
}
template <class Type> istream & operator >>( istream & in, BinaryTree <Type> &Tree ) {
     Type item;
     cout << "Construct a binary tree: \n ";			    
     cout << "Input data (end with" << Tree.RefValue 
             << " ): ";
     in >> item;		//输入				
     while ( item != Tree.RefValue ) {			
		Tree.Insert ( item );
         	cout << "输入数据 ( 用 " << Tree.RefValue  << "结束 ):"; 
            in >> item;
    }
    return in;
}
template <class Type> ostream & operator <<
 ( ostream & out, BinaryTree<Type> &Tree ) {
     out << "二叉树的前序遍历.\n";
     Tree.Traverse ( Tree.root, out );
     out << endl;
     return out;
}



template <class Type> void BinaryTree<Type>::Insert ( const Type &item,BinTreeNode<Type> * &current)
{	
	if(current==NULL)
	{
		current=new BinTreeNode<Type>(item);
		if(current==NULL)
		{
			cout<<"out of space!"<<endl;
			//exit(1);
		}
	}
	else if(item<current->data) Insert(item,current->leftChild);
	else if(item>current->data) Insert(item,current->rightChild);
}


template <class Type> void BinaryTree<Type>::input()
{
	cout<<"input the flag for quiting！"<<endl;
	cout<<"RefValue=";
	cin>>RefValue;
	Type item;
	cout<<"please input the node：";
	cin>>item;
	while(item!=RefValue)
		{
		   Insert(item,root);
		   cout<<"please input the node：";
		   cin>>item;
		}
}