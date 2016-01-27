#include <my_global.h>
#include <mysql.h>

void finish_with_error(MYSQL *con)
{
	fprintf(stderr, "%s\n", mysql_error(con));
	mysql_close(con);
	exit(1);        
}

int main(int argc, char **argv)
{ 
	int status = 0;  

	MYSQL *con = mysql_init(NULL);  

	if (con == NULL)
	{
		fprintf(stderr, "mysql_init() failed\n");
		exit(1);
	}  

	if (mysql_real_connect(con, "192.168.100.130", "root", "123456", 
				"testdb", 3306, NULL, CLIENT_MULTI_STATEMENTS) == NULL) 
	{
		finish_with_error(con);
	}    

	//if (mysql_query(con, "SELECT Name FROM Cars WHERE Id=2;
	if (mysql_query(con, "SELECT Name FROM Cars;\
				SELECT Name FROM Cars WHERE Id=3;SELECT Name FROM Cars WHERE Id=6")) 
	{
		finish_with_error(con);
	}

	do {  
		MYSQL_RES *result = mysql_store_result(con);

		if (result == NULL) 
		{
			finish_with_error(con);
		}

		int num_fields = mysql_num_fields(result);
		MYSQL_ROW row;

		MYSQL_FIELD *field;
		//printf("%s\n", row[0]);
		while ((row = mysql_fetch_row(result))) 
		{ 
			for(int i = 0; i < num_fields; i++) 
			{ 
				if (i == 0) 
				{              
					while((field = mysql_fetch_field(result)) != NULL) 
					{
						printf("%s ", field->name);
					}

					printf("\n");           
				}

				printf("%s  ", row[i] ? row[i] : "NULL"); 
			} 
		}
		printf("\n\n\n\n");

		mysql_free_result(result);

		status = mysql_next_result(con); 

		if (status > 0) {
			finish_with_error(con);
		}

	} while(status == 0);

	mysql_close(con);  
	exit(0);
}
