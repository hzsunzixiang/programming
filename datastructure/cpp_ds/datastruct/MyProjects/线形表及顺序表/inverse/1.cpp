#include <stdlib.h>
#include <iostream.h>
#include <stdio.h>
#include <conio.h>
#define LIST_INIT_LENGTH 10                  
#define OK 1		                                 
typedef int ElemType;    
typedef  struct  CirLNode  
{
	ElemType			data;
	struct CirLNode		*next;
} CirLNode,  *CirLinkList;
void CreateList_L(CirLinkList &L,int n)		//构造 单链表 L
{ 
  int i;
  CirLNode *p;
  int array[LIST_INIT_LENGTH];
  L=(CirLinkList)malloc(sizeof(CirLNode));
  L->next=NULL;
    
  printf("请输入结点的data域,必须为整数,以回车或者空格作为间隔: <如: 34 20 2 3 10 51 12>\n"); 
  for(i=0;i<n;i++)               //输入结点的data元素
 scanf("%d",&array[i]);
  for(i=n-1;i>=0;--i)
  { p=(CirLinkList)malloc(sizeof(CirLNode));	//新建结点
	  p->data=array[i];                 //data 域
	  p->next=L->next;					//next 域
	  L->next=p;
  }     //end of for
  //for(p=L;p->next!=NULL;p=p->next) ;
  //p->next=L;		//最后一个结点指向头结点
} //end of CreateList_L() function 
int Contray_CirL(CirLinkList &L)	// 将单链表逆置，并返回 OK
{CirLinkList t,p,q;
	t=L;
t=t->next;			
p=t->next;	
	t->next=NULL;	
	while (p!= NULL )
	{q=p->next;//修改q结点 next 域指针，使之指向其前驱
	p->next=t;			// 顺链向后移动指针 t
		t=p;			// 顺链向后移动指针 p
		p=q;		// 顺链向后移动指针 q
	} // while 结束
L= t;//
	return OK;
} // Contray_CirL
void main()				//main() 函数
{CirLinkList L;   CirLNode *p;
	int LNodeNum;		// 存储单链表元素的个数
cout<<"请输入单循环链表元素的个数? <如 7> : ";
	cin>>LNodeNum;
	CreateList_L(L,LNodeNum);	//构造单链表L 
cout<<endl<<"新建的单链表L如下:"<<endl;    p=L;
	while(p->next!=NULL)
	{p=p->next;
		cout<<p->data<<" -> ";	//输出单链表元素
	}
	
	Contray_CirL(L);

	cout<<"逆置后的单链表L如下:"<<endl;
	p=L;
	while(p->next!=NULL)
	{
	    p=p->next;
		cout<<p->data<<" -> ";	//输出逆置后的单循环链表
	}

	cout<<endl<<"...OK...!"<<endl;
	getch();
}//end of main() function


