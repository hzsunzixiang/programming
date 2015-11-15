#include<string.h>
#include<iostream.h>
#include<stdlib.h>
#define HEAD 	0
#define INTGR 	1
#define CH 		2
#define LST 		3
class GenList;		//GenList的前视声明
class GenListNode {	      //广义表结点类
friend class GenList;
public:
	int utype;
	 GenListNode *tlink;
union {
        int ref;		        //utype = 0, 表头结点,存放引用计数
        int intgrinfo;	        //utype = 1, 整型	
        char charinfo;             //utype = 2, 字符型
	   GenListNode *hlink;   //utype = 3, 存放指向子表的指	针
	} value;
public:
    GenListNode():utype(0),tlink(NULL){}
	GenListNode & Info ( GenListNode *elem );
     int nodetype ( GenListNode *elem ) { return elem->utype; }
	 friend int equal ( GenListNode *s, GenListNode *t );   //判等
//返回结点的类型
     void setInfo ( GenListNode *elem,GenListNode &x );
//将结点修改为x
};
class GenList {                    //广义表类
private:
//public:
    GenListNode* first;        //广义表表头指针
    GenListNode* Copy ( GenListNode* ls );
//复制一个ls指向的无共享子表的非递归表
    int depth ( GenListNode *ls );//计算深度		
    void Remove (GenListNode *ls );//删除
public:
    GenList ( ); 
    //~GenList ( );
    GenListNode& Head ( );//返回第一个元素的值
    GenList& Tail ( );//返回表尾
    GenListNode *First ( );//返回第一个元素	
    GenListNode *Next ( GenListNode *elem );//返回直接后继
	int CreateList ( GenListNode *ls,  char * s );
	int sever ( char *str1, char *hstr1 ) ;
    void Push ( GenListNode *x );  //将x加入到最前面
    GenList & Addon ( GenList& list,  GenListNode *x );                  //返回一个以x为头,list为尾的新表
    void setHead ( GenListNode& x );//将表的头元素设为x
    void setNext ( GenListNode *elem1,GenListNode *elem2 );
 	friend int operator==(const GenList &l,const GenList &m);
    //void delvalue(GenListNode *ls,const value x);
//将elem2插入到elem1之后
    void setTail ( GenList& list );	//将list定义为广义表的尾
	//int equal(GenListNode *s,GenListNode *t);
    void Copy ( const GenList & l );//广义表的复制
	void output (GenListNode *ls);
    int depth();//计算非递归表的深度
    int Createlist ( GenListNode* ls, char* s );
	void returnFirst ( GenListNode *ls);
//从广义表的字符串描述s出发,建立一个带表头结点的广义表
};
GenListNode & GenListNode ::Info (GenListNode* elem )
 {//提取广义表中指定表元素elem的值
     GenListNode * pitem = new GenListNode;
     pitem->utype = elem->utype;
     pitem->value = elem->value;
     return * pitem;
}
void GenListNode :: setInfo(GenListNode* elem, GenListNode& x ) 
{//将表元素elem中的值修改为x
    elem->utype = x.utype;
    elem->value = x.value; 
}
//广义表类的构造和访问成员函数

GenList :: GenList ( ) {
    first = new GenListNode;	
    first->utype = 0;  first->value.ref = 1;  
    first->tlink = NULL;     //仅建立表头结点
}
GenListNode & GenList :: Head ( ) {
//若广义表非空，返回表的表头元素的值
    if ( first->tlink == NULL ) {       //空表 
		cout<<"Illigal head operation."<<endl;
		exit(1);
    }
    else {
 	  GenListNode * temp = new GenListNode;
       temp->utype = first->tlink->utype;
       temp->value = first->tlink->value;
       return  *temp;
    }
}
GenList & GenList :: Tail ( ) {
//若广义表非空，返回广义表除表头元素外其
//它元素组成的表，否则函数没有定义
    if ( first->tlink == NULL ) {       //空表 
		cout<<"Illigal tail operation."<<endl;
		exit(1);
    }
    else {
       GenList * temp=NULL;
       temp->first->tlink = Copy(first->tlink->tlink);
       return  *temp;
    }
}
GenListNode *GenList::First(){
   //返回广义表的第一个元素（若表空，则返回一个特定的空值）
      if (first->tlink==NULL)  return  NULL;
      else  return  first->tlink;
}
//返回表元素elem的直接后继
GenListNode *GenList::Next(GenListNode  *elem){
  if (elem->tlink==NULL) return NULL;
  else  return  elem->tlink;
}
void GenList::Push ( GenListNode *x ) {
//将表结点 x 加到表的最前端
    if ( first->tlink==NULL) first->tlink=x; 
    else {
        x->tlink=first->tlink;  first->tlink=x;	 
    }
}
GenList & GenList::Addon ( GenList & list, GenListNode *x )
 {
//返回一个以x为头，list为尾的新广义表
    GenList * newlist = new GenList;
    newlist->first = Copy ( list.first );//复制list到newlist
    x->tlink=newlist->first->tlink;//插入结点x
    newlist->first->tlink = x;
    return * newlist;
}  
void GenList:: setHead(GenListNode& x ) 
{//将表的头元素重置为x
    first->tlink->utype = x.utype;
    first->tlink->value = x.value; 
}
void GenList:: setTail(GenList & list ) 
{//将list定义为广义表的表尾
	GenListNode *temp;
	temp=first->tlink->tlink;//temp指向广义表this的表尾
	first->tlink->tlink=list.first->tlink;//this表头的tlink指向list表头
	delete list.first;//删去list表头结点
	//free List(temp);
}
void GenList::setNext(GenListNode *elem1,GenListNode *elem2)
{ 
	GenListNode *temp;
	while (elem1->tlink!=NULL){
		temp=elem1->tlink;
		elem1->tlink=temp->tlink;
		delete temp;
	}
		elem1->tlink=elem2;
}
void GenList::Copy ( const GenList & l ) {             
    first = Copy ( l.first );
}

GenListNode* GenList :: Copy(GenListNode *ls)
{
     GenListNode *q = NULL;
     if ( ls != NULL ) {
        q = new GenListNode;     //创建一个新结点
        q->utype = ls->utype;      //复制标志 utype
		switch ( ls->utype ) {//根据utype来传送值域	
           case HEAD: 
                q->value.ref = ls->value.ref;  break; 	      
           case INTGR: 
                q->value.intgrinfo = ls->value.intgrinfo;
                break; 	          
           case CH : 
                q->value.charinfo = ls->value.charinfo;
                break;		
           case LST: 
                q->value.hlink = Copy ( ls->value.hlink );
                break;	
       }
		q->tlink = Copy ( ls->tlink );
    }
    return q;
}
int GenList::depth ( ) 
{//公共函数：计算一个非递归表的深度
    return depth ( first );
}
int GenList :: depth ( GenListNode *ls ) {//私有函数
    if ( ls->tlink == NULL ) return 1;   //空表
    GenListNode *temp = ls->tlink;  
    int m = 0;
    while ( temp != NULL ) {       //横扫广义表顶层
         if ( temp->utype == LST) {      //求子表深度
 	         int n = depth ( temp->value.hlink );			 
			 if ( m < n ) m = n; //取最大深度
         }
         temp = temp->tlink;      
    }
    return m+1;//返回深度
}
int equal(GenListNode *s,GenListNode *t)
{
	int x;
	if(s->tlink==NULL&&t->tlink==NULL) return 1;//表为空表或比较完
	if(s->tlink!= NULL &&t->tlink!= NULL&&s->tlink->utype==t->tlink->utype)
	{//两表非空且结点类型相同
		 if(s->tlink->utype==INTGR)//同为整型结点
		     if(s->tlink->value.intgrinfo==t->tlink->value.intgrinfo)x=1;
		     else x=0;
		  else if(s->tlink->utype==CH) //同为字符型结点
		     if(s->tlink->value.charinfo==t->tlink->value.charinfo) x=1;
		     else x=0;  
		else x=equal(s->tlink->value.hlink,t->tlink->value.hlink); 
		//同为子表结点，就递归比较子表的结点
	if(x)return equal(s->tlink,t->tlink); //相等，递归比较同层的下一个结点；不等，不再递归比较
	}
	return 0;
}
int operator==(const GenList &l,const GenList &m)
{//l,m都是非递归表，若相等，返回1，否则返回0;
	return equal(l.first,m.first);
}
/*void GenList ::delvalue(GenListNode *ls,const value x) {
//在广义表中删除所有含 x 的结点
    if ( ls->tlink != NULL ) {			
       GenListNode * p = ls->tlink;   //横扫链表
       while ( p !=NULL&&((p->utype==INTGR&&p->value.intgrinfo ==x)||(p->utype==CH&&p->value.charinfo ==x ) ) {
	  ls->tlink = p->tlink;   delete p;     //删除该结点(含x)
           p = ls->tlink;      // p指向同层下一结点
       }       
//链表检测完或遇到子表或走到子表表
       //头结点或不是含x结点, 转出循环
       if ( p != NULL ) {              
          if ( p->utype ==LST)      //到子表中删除
              delvalue ( p->value.hlink, x );	
          delvalue (p,x);	         //向后递归删除
      }
   }
}*/
//有共享子表的情况，只有当引用计数减为0时才能真正释放结点
/*GenList :: ~GenList ( ) {	        //析构函数	
    Remove ( first );
} */
/*void GenList :: Remove (GenListNode *ls ) {  
    ls->value.ref --;	   //引用计数减一
    if ( !ls->value.ref ) {  //引用计数减至0才能删除         
       GenListNode * y = ls;				
       while ( y->tlink != NULL ) {       //横扫链表
           y = y->tlink;
		   if ( y->utype ==LST)            //遇到子表
              Remove ( y->value.hlink );   //递归删除        
       }
       y->tlink = av;  av = ls;
       //扫描完后,回收到可利用空间表	
    }
}*/
int GenList::sever ( char *str1, char *hstr1 ) {
	if(strlen(str1)==0) {hstr1=NULL;return 0;}
//对不含外分界符的字符串分离第一个元素
    char ch = str1[0];   
    int n = strlen ( str1 );
    int i = 0,  k = 0;
    //检测str1,扫描完或遇到', '且括号配对则停
    while ( i < n && ( ch != ',' || k != 0 ) ) {
        if ( ch == '(') k++;//检查括号配对，左括号计数加1
        else if ( ch ==')' ) k--;//遇到右括号，计数减1
        i++;  ch = str1[i];         // i 计数, 取一字符
    }    
	if ( i<n ) {
        strncpy( hstr1, str1, i );
        //str1的前 i-1 个字符传送到hstr1
		hstr1[i]='\0';
        strncpy ( str1, str1+i+1, n-i );
        //后n-i个字符留在str1, 滤去‘,’
		str1[n-i]='\0';
        return 1;
    }
    else if ( k != 0 ) return 0;   //括号不配对出错
           else {	                     //括号配对
              strcpy ( hstr1, str1 );	*str1 =NULL;
              //str1全部传送给hstr1
              return 1;
           }
}
int GenList ::CreateList ( GenListNode *ls,  char * s ) {
   char sub[20], hsub[20];  
   ls = new GenListNode ( );    //建立表头结点
   ls->utype = HEAD;  ls->value.ref = 1;
    cout<<"love"<<ls->tlink<<"you"<<endl;
  if ( strlen (s) == 0 || !strcmp ( s,"()" ) )
  {ls->tlink = NULL;}	          //空表	
  else {// cout<<"hahalial"<<endl;
		strncpy(sub,s+1,strlen(s)-2);
		sub[strlen(s)-2]='\0';
		//cout<<endl<<endl;
		//for(int j=0;j<strlen(sub);j++){
			//cout<<sub[j];}
		cout<<endl<<endl;
      //脱去广义表外面的引号
     GenListNode* p = ls;
	  while ( strlen (sub)!= 0) {   //建立表结点
           p = p->tlink = new GenListNode ( );
           //创建新结点,向表尾链接
           if ( sever (sub, hsub) ) {
			   //cout<<"I love you"<<strlen(sub);
           //以逗号为界,分离第一个表元素hsub
              if ( hsub[0] != '('&& hsub[0] !='\'' ) {
	      //非子表,非字符分界符
                 p->utype = INTGR;    
                 p->value.intgrinfo=atoi ( hsub ); //转换整型结点
				 //cout<<"shide111   "<<ls->utype<<"    love you111 ";
              } 
              else if ( hsub[0] != '(' && hsub[0] == '\'' ) {
              //非子表且是字符分界符
				  p->utype = CH;  
				  p->value.charinfo = hsub[1];	
				  //cout<<"shide222   "<<ls->utype<<"    love you222 "<<endl;
               }
               else {                 //是子表,递归建立子表
                  p->utype = LST; 
				  //cout<<"shide333   "<<ls->utype<<"    love you333 "<<endl;
                  CreateList ( p->value.hlink, hsub );
               }
		   }
            else return 0;     //字符串表达式有错
			cout<<"love"<<ls->tlink<<"me"<<endl;
			cout<<"love"<<p->tlink<<"her"<<endl;
        }       //循环完成
        p->tlink = NULL;  //封闭最后一个结点

    }
  cout<<"lovelove"<<ls->tlink<<"meme"<<endl;
//cout<<"biaozhi "<<ls->utype<<endl;
    return 1;
}

void GenList ::output (GenListNode *ls){
	//cout<<ls->nodetype(ls)<<endl;
	cout<<"hehe i love"<<ls->tlink<<"you"<<endl;
	//cout<<ls->value.ref<<endl;
	//cout<<first->tlink;
	//cout<<ls->depth();
}
void GenList ::returnFirst (GenListNode *ls)
{
	this->first=ls;
}

