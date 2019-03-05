#include <iostream>
#include <string.h>
#include <limits.h>     /* PATH_MAX */
#include <sys/stat.h>   /* mkdir(2) */
#include <errno.h>

int main()
{
	if (mkdir("20180910", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1)
	{
		if( errno == EEXIST ) {
			// alredy exists
			std::cout << "alread exists:" << strerror(errno) << std::endl;
		} else {
			// something else
			std::cout << "cannot create sessionnamefolder error:" << strerror(errno) << std::endl;
			//throw std::exception(strerror(errno));
		}
	}
}
