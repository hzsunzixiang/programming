#include<time.h>
#include <unistd.h>
#include <syscall.h>
#include<stdexcept>
#include <vector>
#include<algorithm>
#include"dSFMT.h"

#include <fcntl.h>
#include <sys/time.h>
#include <pthread.h>
#define INIT_LOCK(mutex) pthread_mutex_init(&mutex, NULL) != 0
#define DESTROY_LOCK(mutex) pthread_mutex_destroy(&mutex)
#define LOCK(mutex)  pthread_mutex_lock(&mutex)
#define UNLOCK(mutex) pthread_mutex_unlock(&mutex)

#define MAX_SHUFFLE_COUT (10000)

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


#define POOL_LEN 100
class Random
{
	public:
		Random()
		{
			if (INIT_LOCK(mutex))
				throw std::runtime_error("init mutex error");
			dsfmt_init_gen_rand(&dsfmt, (uint32_t)time(NULL));
			for (int i = 0; i < POOL_LEN; ++i)
				pool[i] = dsfmt_genrand_close_open(&dsfmt);

		}
		Random(uint32_t seed)
		{
			if(INIT_LOCK(mutex))
				throw std::runtime_error("init mutex error");
			dsfmt_init_gen_rand(&dsfmt, seed);
			for (int i = 0; i < POOL_LEN; ++i)
				pool[i] = dsfmt_genrand_close_open(&dsfmt);
		}
		~Random()
		{
			DESTROY_LOCK(mutex);
		}
		void reset_seed(uint32_t seed)
		{
			LOCK(mutex);
			dsfmt_init_gen_rand(&dsfmt, seed);
			UNLOCK(mutex);
		}
		uint32_t get_uint32()
		{
			double w = get_double();
			int16_t idx = 50 << 4;
			((int16_t *)&w)[3] += idx;
			return (uint32_t)w;
		}
		double get_double()
		{
			int idx = _rand() % POOL_LEN;
			LOCK(mutex);
			double ret = pool[idx];
			pool[idx] = dsfmt_genrand_close_open(&dsfmt);
			UNLOCK(mutex);
			return ret;
		}
		uint32_t get_int32_in_range(uint32_t l, uint32_t h)
		{
			if (l > h)
				throw std::logic_error("Random::get_int32_in_range: range error\n");
			double w = get_double();
			return uint32_t(l + (h - l + 1) * w);
		}
	private:
		double pool[POOL_LEN];

		pthread_mutex_t mutex;
		dsfmt_t dsfmt;
};

static uint32_t get_uint32_from_time()
{
	uint32_t seed;
	struct timeval tv;
	gettimeofday(&tv, NULL);
	seed = (uint32_t)tv.tv_usec;
	return seed;
}

uint32_t get_rand_uint32()
{
	uint32_t ret;
	static Random theRandom(get_uint32_from_time());
	ret = theRandom.get_uint32();
	return ret;
}

uint32_t get_good_seed()
{
	uint32_t n = get_rand_uint32() % 100;
	for (uint32_t i = 0; i < n; ++i)
		get_rand_uint32();
	return get_rand_uint32();
}

int main()
{

	for(int i=0; i<100; i++ )
	{
		printf("random:%u\n", get_good_seed());
	}
	return 0;
}
