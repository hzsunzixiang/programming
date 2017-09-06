#include <fstream>
#include <cstring>
#include <boost/random/linear_congruential.hpp>
#include <boost/random/uniform_int.hpp>
#include <boost/random/uniform_real.hpp>
#include <boost/random/variate_generator.hpp>
#include <boost/generator_iterator.hpp>
#include <boost/random/mersenne_twister.hpp>

static unsigned short MyTestGlobal[52] =
{
	0x0102, 0x0103, 0x0104, 0x0105, 0x0106, 0x0107, 0x0108, 0x0109, 0x010A, 0x010B, 0x010C, 0x010D, 0x010E,//方块
	0x0202, 0x0203, 0x0204, 0x0205, 0x0206, 0x0207, 0x0208, 0x0209, 0x020A, 0x020B, 0x020C, 0x020D, 0x020E,//梅花
	0x0302, 0x0303, 0x0304, 0x0305, 0x0306, 0x0307, 0x0308, 0x0309, 0x030A, 0x030B, 0x030C, 0x030D, 0x030E,//红桃
	0x0402, 0x0403, 0x0404, 0x0405, 0x0406, 0x0407, 0x0408, 0x0409, 0x040A, 0x040B, 0x040C, 0x040D, 0x040E//黑桃
};

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
