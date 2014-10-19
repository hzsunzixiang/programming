// http://stackoverflow.com/questions/1692814/exception-handling-in-c-what-is-the-use-of-setjmp-returning-0
#include <stdio.h>
#include <setjmp.h>
#include <string.h>
#include <stdlib.h>

void foo ( char** data ) ;
void handle ( char* data ) ;
jmp_buf env;

int main ()
{
	char* data = 0;

	int res = setjmp ( env ); 
	// stored for demo purposes. 
	// in portable code do not store 
	// the result, but test it directly.

	printf ( "setjmp returned %d\n", res );

	if ( res == 0 )
		foo ( &data );
	else
		handle ( data );

	return 0;
}


void foo ( char** data )
{
	*data = malloc ( 32 );

	printf ( "in foo\n" );

	strcpy ( *data, "Hello World" );

	printf ( "data = %s\n", *data );

	longjmp ( env, 42 );
}

void handle ( char* data )
{
	printf ( "in handler\n" );

	if ( data ) {
		free ( data );
		printf ( "data freed\n" );
	}
}

//setjmp returned 0
//in foo
//data = Hello World
//setjmp returned 42
//in handler
//data freed

