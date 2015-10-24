#include <iostream>
#include <string>
#include <stdint.h>

#include <boost/lexical_cast.hpp>
#include <boost/format.hpp> 
#include <boost/foreach.hpp>
#include <boost/lexical_cast.hpp>
#include <boost/range/algorithm.hpp>
#include <boost/algorithm/string.hpp>
#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/xml_parser.hpp>



using namespace std;
using std::string;
using std::vector;
using std::max;
using std::back_inserter;
using std::ifstream;
using std::ofstream;
using std::stringstream;
using std::ostringstream;
using std::exception;

using boost::lexical_cast;

string GetCodOrderTableName() 
{
	std::string m_strLogisticsSpid = "1303982833";
	uint32_t id = lexical_cast<uint32_t>(m_strLogisticsSpid) % 128;
	boost::format fmt = boost::format("%03d") % id;
	return "t_cod_order_" + fmt.str();
}

int main()
{
	
	cout << GetCodOrderTableName() << endl;
	return 0;
}

