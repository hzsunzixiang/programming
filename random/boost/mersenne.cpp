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




//// weighted_die.cpp
////
//// Copyright (c) 2009
//// Steven Watanabe
////
//// Distributed under the Boost Software License, Version 1.0. (See
//// accompanying file LICENSE_1_0.txt or copy at
//// http://www.boost.org/LICENSE_1_0.txt)
//
////[weighted_die
///*`
//  For the source of this example see
//  [@boost://libs/random/example/weighted_die.cpp weighted_die.cpp].
// */
//#include <boost/random/mersenne_twister.hpp>
//#include <boost/random/uniform_real.hpp>
//#include <boost/random/variate_generator.hpp>
//#include <vector>
//#include <algorithm>
//#include <numeric>
//
//boost::mt19937 gen;
//
///*`
//  This time, instead of a fair die, the probability of
//  rolling a 1 is 50% (!).  The other five faces are all
//  equally likely.
// */
//static const double probabilities[] = {
//	0.5, 0.1, 0.1, 0.1, 0.1, 0.1
//};
//
///*`
//  Now define a function that simulates rolling this die.
//  Note that the C++0x library contains a `discrete_distribution`
//  class which would be a better way to do this.
// */
//int roll_weighted_die() {
//	std::vector<double> cumulative;
//	std::partial_sum(&probabilities[0], &probabilities[0] + 6,
//			std::back_inserter(cumulative));
//	boost::uniform_real<> dist(0, cumulative.back());
//	boost::variate_generator<boost::mt19937&, boost::uniform_real<> > die(gen, dist);
//	/*<< Find the position within the sequence and add 1
//	  (to make sure that the result is in the range [1,6]
//	  instead of [0,5])
//	  >>*/
//	return (std::lower_bound(cumulative.begin(), cumulative.end(), die()) - cumulative.begin()) + 1;
//}
//
////]
//
//#include <iostream>
//
//int main() {
//	for(int i = 0; i < 10; ++i) {
//		std::cout << roll_weighted_die() << std::endl;
//	}
//}
