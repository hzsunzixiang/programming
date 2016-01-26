#include <my_global.h>
#include <mysql.h>
#include <stdlib.h>

int main(int argc, char **argv)
{  
	MYSQL *con = mysql_init(NULL);

	if (con == NULL) 
	{
		fprintf(stderr, "%s\n", mysql_error(con));
		exit(1);
	}

// MYSQL *		STDCALL mysql_real_connect(MYSQL *mysql, const char *host,
// 					   const char *user,
// 					   const char *passwd,
// 					   const char *db,
// 					   unsigned int port,
// 					   const char *unix_socket,
// 					   unsigned long clientflag);
	if (mysql_real_connect(con, "192.168.100.130", "root", "123456", 
				NULL, 3306, NULL, 0) == NULL) 
	{
		fprintf(stderr, "%s\n", mysql_error(con));
		mysql_close(con);
		exit(1);
	}  

	if (mysql_query(con, "DROP DATABASE testdb3")) 
	{
		fprintf(stderr, "%s\n", mysql_error(con));
		//mysql_close(con);
		//exit(1);
	}
	if (mysql_query(con, "CREATE DATABASE testdb3")) 
	{
		fprintf(stderr, "%s\n", mysql_error(con));
		mysql_close(con);
		exit(1);
	}

	pause();
	mysql_close(con);
	exit(0);
}
