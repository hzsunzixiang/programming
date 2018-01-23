#include <stdio.h>
#include <stdlib.h>


#define MAXLEN 80
#define EXTRA 5

// root@debian32-1:/var/www# ls submit_post_c.html
 
/* 4 for field name "data", 1 for "=" */
#define MAXINPUT MAXLEN + EXTRA + 2
/* 1 for added line break, 1 for trailing NUL */
//#define DATAFILE "/tmp/data.txt"  // 注意文件的权限问题 
#define DATAFILE "./data.txt"

void unencode(char *src, char *last, char *dest)
{
	for(; src != last; src++, dest++)
		if(*src == '+')
			*dest = ' ';
		else if(*src == '%') {
			int code;
			if(sscanf(src+1, "%2x", &code) != 1) code = '?';
			*dest = code;
			src +=2; }     
		else
			*dest = *src;
	*dest = '\n';
	*++dest = '\0';
}

int main(void)
{
	char *lenstr;
	char input[MAXINPUT], data[MAXINPUT];
	long len;
	printf("%s%c%c\n",
			"Content-Type:text/html;charset=iso-8859-1",13,10);
	printf("<TITLE>Response</TITLE>\n");
	printf("<P>test line.\n");
	lenstr = getenv("CONTENT_LENGTH");
	printf("lenstr::%s.\n", lenstr);

	if(lenstr == NULL || sscanf(lenstr, "%ld", &len)!=1 || len > MAXLEN)
		printf("<P>Error in invocation - wrong FORM probably.\n");
	else {
		FILE *f;
		fgets(input, len + 1, stdin);
		//// EXTRA 个前导字符
		unencode(input + EXTRA, input + len, data);
		f = fopen(DATAFILE, "a");
		if(f == NULL)
		{
			printf("<P>Sorry, cannot store your data.\n");
			exit(0); // 必须得有 不然 f为NULL时 close的时候会异常
		}
		else
			fputs(data, f);
		fclose(f);
		printf("<P>Thank you! Your contribution has been stored.\n");
	}
	return 0;
}

// 注意输入的时候有5个前导字符 

// root@debian32-1:/usr/lib/cgi-bin/c# env CONTENT_LENGTH=79 bash -c "./query_post"
// Content-Type:text/html;charset=iso-8859-1
// 
// <TITLE>Response</TITLE>
// -----hello,world.
// <P>Thank you! Your contribution has been stored.
// root@debian32-1:/usr/lib/cgi-bin/c# cat data.txt
// hello,world.


// 注意文件权限
// root@debian32-1:/usr/lib/cgi-bin/c# ll data.txt
// -rw-r--r-- 1 www-data root 25 Jan  7 15:56 data.txt

//#define DATAFILE "/usr/lib/cgi-bin/c/data.txt"





// root@debian32-1:/usr/lib/cgi-bin# ll
// total 32K
// drwxr-xr-x 2 www-data root 4.0K Jan  7 15:57 c
// -rwxr-xr-x 1 www-data root  430 Dec 31 19:04 example.sh
// -rwxr-xr-x 1 www-data root 5.7K Jan  7 15:57 helloworld
// -rw-r--r-- 1 www-data root  135 Dec 29 19:31 helloworld.c
// -rw-r--r-- 1 www-data root  133 Dec 29 19:31 Makefile
// -rwxr--r-- 1 www-data root   66 Dec 31 19:15 rsync.sh
// drwxr-xr-x 3 www-data root 4.0K Jan  7 14:40 shell

