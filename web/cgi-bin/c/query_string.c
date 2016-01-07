#include <stdio.h>
#include <stdlib.h>


int main(void)
{
	char *data;
	long m,n;
	printf("%s%c%c\n",  //  13 10 回车换行
			"Content-Type:text/html;charset=iso-8859-1", 13, 10);
	printf("<TITLE>Multiplication results</TITLE>\n");
	printf("<H3>Multiplication results</H3>\n");
	data = getenv("QUERY_STRING");
	printf("QUERY_STRING:%s.\n", data);
	if(data == NULL)
		printf("<P>Error! Error in passing data from form to script.");
	else if(sscanf(data,"m=%ld&n=%ld", &m, &n) != 2)
		printf("<P>Error! Invalid data. Data must be numeric.\n");
	else
		printf("<P>The product of %ld and %ld is %ld.\n" ,m ,n, m*n);
	return 0;
}



//       012   10    0A    LF  '\n' (new line)         112   74    4A    J
//       015   13    0D    CR  '\r' (carriage ret)     115   77    4D    M

// 调试方法
//root@debian32-1:/usr/lib/cgi-bin/c# env QUERY_STRING="m=5&n=9" bash -c "./query_string"
//Content-Type:text/html;charset=iso-8859-1
//
//<TITLE>Multiplication results</TITLE>
//<H3>Multiplication results</H3>
//QUERY_STRING:m=5&n=9.
//<P>The product of 5 and 9 is 45.


// root@debian32-1:/usr/lib/cgi-bin/c# curl "localhost/cgi-bin/c/query_string?m=7&n=9"
// <TITLE>Multiplication results</TITLE>
// <H3>Multiplication results</H3>
// QUERY_STRING:m=7&n=9.
// <P>The product of 7 and 9 is 63.


// html：  /var/www/submit_get_c.html

// 发送url
// http://12.168.1.102/cgi-bin/c/query_string?m=1&n=2

// Multiplication results
// 
// QUERY_STRING:m=1&n=2.
// The product of 1 and 2 is 2.
// 
