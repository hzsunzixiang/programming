#include<iostream.h>
#include<stdlib.h>
//#include"Genlist.h"
#include<string.h>
int main()
{
	char p[30]="'b'";
	char hstr1[21];
	char ch=p[0];
	int n=strlen(p);
    int i=0,k=0;
	if (n==0){*hstr1=NULL;// return 0;
	cout<<"hello"<<strlen(hstr1);
	return 0;}
    //检测str1,扫描完或遇到', '且括号配对则停
    while ( i < n && ( ch != ',' || k != 0 ) ) {
        if ( ch == '(') k++;//检查括号配对，左括号计数加1
        else if ( ch ==')' ) k--;//遇到右括号，计数减1
        i++;  ch = p[i];         // i 计数, 取一字符
    }    
	if ( i<n ) {
        strncpy ( hstr1, p, i);
		hstr1[i]='\0';
        //str1的前 i-1 个字符传送到hstr1
        strncpy ( p, p+i+1, n-i );
		p[n-i]='\0';
        //后n-i个字符留在str1, 滤去‘,’
    }
    else if ( k != 0 )  cout<<"return 0"; //return 0;   //括号不配对出错
           else {	                     //括号配对
              strcpy ( hstr1, p);  //p =0;
			  *p=NULL;
              //str1全部传送给hstr1
           }
		   cout<<strlen(p)<<endl;
		   cout<<strlen(hstr1)<<endl;
		   for (i=0;i<strlen(hstr1);i++){
			   
			   cout<<hstr1[i];}
		   cout<<endl;
		   cout<<strlen(p);
		   for (i=0;i<strlen(p);i++){
			   cout<<"lijieni"<<p[i];}
		   return 0;
}
	
