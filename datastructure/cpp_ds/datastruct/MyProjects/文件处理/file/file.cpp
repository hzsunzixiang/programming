#include <stdio.h>
#include <string.h>
void main(int argc,char *argv[])
{         char st[80];
	int i,j,k;
	if(argc!=4)
	{  printf("输入格式不对\n");  exit(-1);	}
	for(i=1;i<3;i++)
	{  k=i;
               for(j=i+1;j<4;j++)
               if(strcmp(argv[j],argv[k])>0)  k=j;    
               if(k!=i)
	     {  strcpy(st,argv[i]);
		strcpy(argv[i],argv[k]);
		strcpy(argv[k],st);
	     }  
          }
	for(i=1;i<4;i++)
	    printf("%s\n",argv[i]);
}
 