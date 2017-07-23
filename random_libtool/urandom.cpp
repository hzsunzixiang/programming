#include<time.h>
#include <unistd.h>
#include <syscall.h>
#include<stdexcept>
#include <vector>
#include<algorithm>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <iterator>
#include <iostream>
#include <stdint.h>
#include <stdio.h>

// https://www.2uo.de/myths-about-urandom/
// man urandom
// NAME
//        random, urandom - kernel random number source devices
// 
// SYNOPSIS
//        #include <linux/random.h>
// 
//        int ioctl(fd, RNDrequest, param);

using namespace std;

class LinuxRand
{
	public:
		LinuxRand()
		{
			init();
		}
		uint32_t rand()
		{
			uint32_t r = 0;
			read(fd, &r, sizeof(r));
			return r;
		}
		std::vector<unsigned int> rand(int size)
		{
			unsigned int buf[size];
			read(fd, &buf, size * sizeof(unsigned int));
			return std::vector<unsigned int>(&buf[0], &buf[size]);
		}
		std::vector<unsigned int> rand(int size, unsigned int low, unsigned int high)
		{
			std::vector<unsigned int> ret = this->rand(size);
			for(int i = 0; i < size; i++)
			{
				ret[i] = (ret[i] % (high + 1 - low)) + low;
			}
			return ret;
		}

		uint32_t operator ()()
		{
			return this->rand();
		}

		std::vector<unsigned int> operator ()(int size)
		{
			return this->rand(size);
		}

		std::vector<unsigned int> operator ()(int size, unsigned int low, unsigned int high)
		{
			return this->rand(size, low, high);
		}

	private:
		bool init()
		{
			fd = open("/dev/urandom", O_RDONLY, 0);
			if (fd < 0)
			{
				fprintf(stderr, "no /dev/urandom !!!\n");
				return false;
			}
			return true;
		}
		int fd;
};

// LinuxRand _rand;
// 
// 
// 
// int main()
// {
// 	int fd = open("/dev/urandom", O_RDONLY, 0);
// 	if (fd < 0)
// 	{
// 		fprintf(stderr, "no /dev/urandom !!!\n");
// 		return false;
// 	}
// 	uint32_t r = 0;
// 	int readsize = read(fd, &r, sizeof(r));
// 	//printf("size:%d r:%u\n", readsize, r);
// 
// 	//int size = 2222222222;
// 	int size = 22;
// 	//unsigned int buf[size];
// 	unsigned int *buf = (unsigned int*)malloc(size * sizeof(int));
// 	read(fd, buf, size * sizeof(unsigned int));
// 	std::vector<unsigned int> randoms(&buf[0], &buf[size]);
// 	//std::vector<unsigned int> randoms(buf, &buf[size]);
// 	std::copy(randoms.begin(), randoms.end(), std::ostream_iterator<unsigned int>(std::cout, "\n"));
// 	cout << endl;
// 
// 	return 0;
// }
