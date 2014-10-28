


#include <ctime>
#include <iostream>
#include <unistd.h>

using namespace std;

int main()
{
    time_t hold_time;
    time_t hold_end;
    hold_time=time(NULL);
    cout<<"The number of elapsed seconds since Jan. 1, 1970 is "<<hold_time;
	sleep(10);
    hold_end=time(NULL);
    cout<<"The number of elapsed seconds "<<hold_end - hold_time <<endl;
} 

//time_t t1=time(NULL);
//             do_something_long();
//             time_t t2=time(NULL);
