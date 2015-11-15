#include<iostream.h>
int Josephus(int *Child,int n,int m);
void main()
{
int *allChild,j,k,l;
cout<<"the total number of the people"<<endl;
cin>>j;
cout<<"the number to count:"<<endl;
cin>>k;
cout<<"the ID of everyone"<<endl;
  if((allChild= new int[j])!=NULL)
  {
    for(l=0;l<j;l++)
    {  
     cout<<l+1<<",";
     allChild[l]=l+1;
    }
    cout<<endl<<endl<<endl;
    cout<<"the result:"<<endl<<Josephus(allChild,j,k)<<endl;
  }
}

int Josephus(int *Child,int n,int m)
{
int i=-1,j=0,k=1;
cout<<"the sequence of dequeue"<<endl;
while(1)
{
  for(j=0;j<m;)
  {
   i=(i+1)%n;    
   if(Child[i]!=-1) 
    j++;
   
  }

   if(k==n)                        
    break;                        
   cout<<Child[i]<<",";  

   Child[i]=-1;         
   k=k+1;

}
cout<<endl;
return(Child[i]);    
} 