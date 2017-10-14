#!/bin/bash
awk '
BEGIN{
	print "please input some word,and each word separate with space:";
	getline;
	sort($0,"");
	printf("\n There are %d way to permutation these word\n",counter);
}
function sort(all_word,   buffer,new_all_word,nf,i,j)
{
    $0=all_word; #all_word给$0之后awk将自动进行字段分割,默认使用空格分割
	nf=NF;  #分割后NF是all_word上的单词个数
    if(nf==1) #只有最后一个单词时，
    {
    	 print buffer all_word;#buffer的内容再加上all_word是完成一次排列的结果
         counter++;
	     return;
    }
	  #一般情况:每次从all_word中取出一个元素放到buffer中,再用all_word 剩余元素new_all_word往下进行排列
    else for(i=1;i<=nf;i++)
	{
	   $0=all_word;#$0作为全局变量，内容发生改变，所以重新把all_word赋给$0，令awk再做一次字段分割
	   new_all_word="";
	   for(j=1;j<=nf;j++)#连接new_all_word
	      if(j!=i) new_all_word=new_all_word " " $j;
	   sort(new_all_word,buffer " " $i);
	}
}'

