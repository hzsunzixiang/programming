#include<time.h>
#include <unistd.h>
#include <syscall.h>
#include<stdexcept>
#include <vector>
#include<algorithm>
#include <algorithm>
#include <iostream>
#include <iterator>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


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

LinuxRand _rand;


uint32_t rand_range(unsigned rand, unsigned int l, unsigned int h)
{
	return (rand % (h + 1 - l)) + l;
}

/***
https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle

-- To shuffle an array a of n elements (indices 0..n-1):
for i from 0 to n−2 do
     j ← random integer such that i ≤ j < n
     exchange a[i] and a[j]
  ***/
int shuffleup(int* arrayShuffle, size_t arraySize)
{
	std::vector<unsigned int> randoms = _rand(arraySize - 1);
	cout << "the random:" << endl;
	std::copy(randoms.cbegin(), randoms.cend(),
			std::ostream_iterator<unsigned int>(std::cout, " "));
	std::cout<<std::endl;

	for (uint32_t i = 0; i < arraySize-1; i++)
	{
		cout << "begin i " << i << endl;
		int index = rand_range(randoms[i], i, arraySize - 1);
		std::swap(arrayShuffle[i], arrayShuffle[index]);
		cout << "after i " << i << "\tindex\t " << index <<  endl;
		std::copy(arrayShuffle, arrayShuffle+arraySize,
				std::ostream_iterator<unsigned int>(std::cout, " "));
		cout << endl;
	}
	return 0;
}

// -- To shuffle an array a of n elements (indices 0..n-1):
// 	for i from n−1 downto 1 do
// 	     j ← random integer such that 0 ≤ j ≤ i
// 	     exchange a[j] and a[i]
int shuffledown(int* arrayShuffle, size_t arraySize)
{
	std::vector<unsigned int> randoms = _rand(arraySize - 1);
	cout << "the random:" << endl;
	std::copy(randoms.cbegin(), randoms.cend(),
			std::ostream_iterator<unsigned int>(std::cout, " "));
	std::cout<<std::endl;

	for (uint32_t i = arraySize-1; i>=1; i--)
	{
		cout << "begin i " << i << endl;
		int index = rand_range(randoms[i], 0, i);
		std::swap(arrayShuffle[i], arrayShuffle[index]);
		cout << "after i " << i << "\tindex\t " << index <<  endl;
		std::copy(arrayShuffle, arrayShuffle+arraySize,
				std::ostream_iterator<unsigned int>(std::cout, " "));
		cout << endl;
	}
	return 0;
}

int shuffle(int* arrayShuffle, size_t arraySize)
{
	return shuffledown(arrayShuffle, arraySize);
}
int main()
{
	int arrayShuffle[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};

	cout << "the array to be shuffle:" << endl;
	std::copy(arrayShuffle, arrayShuffle+sizeof(arrayShuffle)/sizeof(int),
			std::ostream_iterator<unsigned int>(std::cout, " "));
	cout << endl;

	std::cout<<std::endl;
	shuffle(arrayShuffle, sizeof(arrayShuffle)/sizeof(int));

	cout << "the array after shuffle:" << endl;
	std::copy(arrayShuffle, arrayShuffle+sizeof(arrayShuffle)/sizeof(int),
			std::ostream_iterator<unsigned int>(std::cout, " "));
	cout << endl;
	return 0;
}
