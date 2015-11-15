#include<iostream.h>
#include<iomanip.h>
#include<fstream.h>
//用类定义一个节点，包含x坐标和y坐标以及该节点的值value
class CNode
{
public:
 int x;
 int y;
 int value;
 void SetValue(){value=1;}
 void ClearValue(){value=0;}
};
CNode array[8][8];//定义一个8*8的节点矩阵
int cnt=0;//定义一个计数器
//打印函数,打印此时的矩阵数据
void PrintArray(ofstream& out)
{
 int i,j;
 for(i=0;i<8;i++)
 {
  for(j=0;j<8;j++)
  {
   out<<setw(3)<<array[i][j].value;
  }
  out<<endl;
 }
 return;
}
//判断a节点是否与位于a节点之前已存在所有任一节点位于同一直线上
int InSameLine(CNode a)
{
 int i,j;
 for(i=0;i<=a.y;i++)
  for(j=0;j<(i<a.y?8:a.x);j++)
  {
   if(array[i][j].value==1)
   {
    if(a.x==array[i][j].x||a.y==array[i][j].y||
    a.x-a.y==array[i][j].x-array[i][j].y||
    a.x+a.y==array[i][j].x+array[i][j].y)
    return 1;
   }
  }
  return 0;
}
//依次产生所有的节点
void CreateNextNode(int row,ofstream out)
{
 if(row==8)
 {
     out<<"第"<<cnt+1<<"种解法"<<endl;
  PrintArray(out);
  cnt++;
  out<<endl;
  return;
 }
 for(int j=0;j<8;j++)
 {
  if(!InSameLine(array[row][j]))
  {
   array[row][j].SetValue();
   CreateNextNode(++row,out);
   array[--row][j].ClearValue();
  }
 }
}
//主函数main()
void main()
{
 ofstream outfile("c:\\result.txt");
 if(!outfile)
 {
  cout<<"打开文件失败!"<<endl;
  return;
 }
 int i,j;
    for(i=0;i<8;i++)
  for(j=0;j<8;j++)
  {
   array[i][j].x=j;
   array[i][j].y=i;
   array[i][j].value=0;
  }
 CreateNextNode(0,outfile);
 outfile<<"总共有"<<cnt<<"种解法"<<endl;
 outfile.close();
 cout<<"传输文件完毕!"<<endl;
 return;
}
 
 
