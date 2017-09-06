#include <fstream>
#include <cstring>
#include <boost/random/linear_congruential.hpp>
#include <boost/random/uniform_int.hpp>
#include <boost/random/uniform_real.hpp>
#include <boost/random/variate_generator.hpp>
#include <boost/generator_iterator.hpp>
#include <boost/random/mersenne_twister.hpp>



class RandomGenerator {
	typedef boost::mt19937 base_generator_type;
	typedef boost::uniform_int<> distribution_type;
	typedef boost::variate_generator<base_generator_type&, distribution_type> gen_type;
public:
	RandomGenerator() :
		m_generator(time(0)+getpid()),
		m_die_gen(m_generator, distribution_type(1, INT_MAX)),
		m_die(&m_die_gen)
	{
	}
	int rand() {
		return *m_die++;
	}

    int reset_seed(unsigned seed)
    {
        m_generator.seed(seed);
    }

	int randBetween(int l, int h) {
		return l + ((*m_die++) % (h - l + 1));
	}

private:
	base_generator_type m_generator;
	gen_type m_die_gen;
	boost::generator_iterator<gen_type> m_die;
};



static RandomGenerator _rg;
int main()
{
	unsigned int seed = 1;
	// 虽然种子一样 但是生成的序列完全不一样
	_rg.reset_seed(seed);
	for(int i=0; i<10; i++ )
	{
		printf("random:%u\n", _rg.rand());
	}
	//_rg.rand();
	return 0;
}
