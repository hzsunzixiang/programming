#include<iostream.h>
#include<stdlib.h>
//#include"Genlist.h"
#include<string.h>
int sever ( char *str1, char *hstr1 );
int main()
{
	//GenList List;
	char p[30]="(2,('b',7)),(),('d')";
	char hstr1[21];
     //p="((2,('b',7)),(),('d'))";
	 //cout<<strlen(p)<<endl;
	//	p="()";
    //for (int i=0;i<22;i++){
		//cout<<p[i];
//	}
	//char *hstr1=NULL;
	//cout<<sever( p, hstr1 );
	for(int i=0;i<strlen(p);i++){
		cout<<p[i];}
	return 1;
}
int sever ( char *str1, char *hstr1 ) {
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
        strncpy ( hstr1, str1, i );
        //str1的前 i-1 个字符传送到hstr1
		str1[i]='\0';
        strncpy ( str1, str1+i+1, n-i );
        //后n-i个字符留在str1, 滤去‘,’
		str1[n-i]='\0';
        return 1;
    }
    else if ( k != 0 ) return 0;   //括号不配对出错
           else {	                     //括号配对
              strcpy ( hstr1, str1 );  *str1 =NULL;
              //str1全部传送给hstr1
              return 1;
           }
}
	
	