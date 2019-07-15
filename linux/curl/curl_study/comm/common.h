#pragma once

#include <string>
#include <map>
#include <time.h>
#include <stdio.h>
#include <openssl/sha.h>
#include <openssl/hmac.h>
#include <openssl/md5.h>
#include <string.h>

using namespace std;

typedef long long LONG;
typedef map<string, string> CStr2Map;

#define NOT_NULL_STR(p) (p == NULL ? "" : p)

string toString( int value );

string toString( long value );

string toString(LONG value);


/*
 * ��iContentȡ��λ��iKey1 ��iKey2 ֮����Ӵ�
 */
string extractValueByKeys( char *iContent, const char *iKey1, const char *iKey2 );

/*
 * ��������ԭ������sha1ǩ��
 */
string gen_sha1_sign( const string &sign_src );

/*
 * ��������ԭ������hmac-sha256ǩ��
 */
string gen_hmac_sha256_sign( const string &sign_src, const string &key );
string gen_hmac_sha256_sign_raw( const string &sign_src, const string &key );

/*
 * charת��Ϊ16����
 */
string char2hex( char c );

/*
 * ������ת��Ϊʮ�������ַ���
 */
void binary2hex( char *bin, int binlen, char *dest );

 
/*
 * ��ȡ��ǰ������
 */
string GetMonthDate();

string GetTodayDate();


/*
 * xmlת��ΪMAP
 */
void parseXmlToMap( const string &content, CStr2Map &outMap );

/*
 * ɾ���Ӵ�������������
 */
string delete_substring( string src, const string &sub_string );

string genSHA1Sign( const std::string &strSrc );
string genSHA256Sign( const std::string &strSrc );

/*
 * �õ������κ�urldecode�任��MAP
 */
void getRawMap( const string &strRawQryData, CStr2Map &rawMap );

/*
 * �õ�ĩβ��ƴ��&��ǩ��ԭ��
 */
string urlEncodeForBody(CStr2Map &reqMap, bool urlEncode);

//string get_weixin_package( CStr2Map &reqMap );
//string CreateIaSign( const string &spid, const CStr2Map &md5src );
string Str2UTF8( const string &strSrc );


string sha256(const string& strSrc);

string map2Xmlstring(CStr2Map inputMap);

string replaceSpecialChar(const string &strSrc);

string replaceSpecialWchar(const string &strSrc, const string &locale = "zh_CN.UTF-8");

char* getMd5(const char *key, int len, char *szRes, int iResSize);

string getMd5(const string &srcText);

string appendUrl(const string& url, const string& str);

string getSignStr(CStr2Map &reqMap, bool urlEncode);


