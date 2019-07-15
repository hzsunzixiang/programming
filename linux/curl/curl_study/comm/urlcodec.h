#ifndef __URLCODEC_H__
#define __URLCODEC_H__

#include <string>
#include <string.h>
#include <map>
#include <iostream>
#include <sstream>

using namespace std;

typedef map<string,string> CStr2Map;

std::string regUrlEncode(const std::string& src);
std::string regUrlDecode(const std::string& src);
/*
std::string urlEncode(const std::string& src, char sep = '&');
std::string urlDecode(const std::string& src, char sep = '&');
std::string urlpack(CStr2Map src);
*/
#endif // __URLCODEC_H__

