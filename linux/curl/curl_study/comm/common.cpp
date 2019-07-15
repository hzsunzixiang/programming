#include "common.h"

#define ErrorLog printf
#define InfoLog printf
#define DebugLog printf
#include <openssl/hmac.h>
#include "urlcodec.h"
string toString( int value )
{
    char szTmp[128];
    snprintf( szTmp, sizeof( szTmp ), "%d", value );
    return szTmp;
}

string toString( long value )
{
    char szTmp[128];
    snprintf( szTmp, sizeof( szTmp ), "%ld", value );
    return szTmp;
}

/**
 * ������ת��Ϊ�ַ���
 */
string toString(LONG value)
{
    char szTmp[128];
    snprintf(szTmp, sizeof(szTmp), "%lld", value);
    return szTmp;
}

string extractValueByKeys( char *iContent, const char *iKey1, const char *iKey2 )
{
    char *p1 = NULL, *p2 = NULL;
    
    string result;
    
    p1 = strstr( iContent, iKey1 );
    
    if( p1 == NULL )
    {
        return "";
    }
    
    if( NULL == p1 + 1 )
    {
        return "";
    }
    
    
    p2 = strstr( p1 + 1, iKey2 );
    
    if( p2 == NULL )
    {
        return "";
    }
    
    result.assign( p1 + strlen( iKey1 ), p2 - ( p1 + strlen( iKey1 ) ) );
    return result;
}


/*
 * ��������ԭ������sha1ǩ��
 */
string gen_sha1_sign( const string &sign_src )
{
    char md[SHA_DIGEST_LENGTH];
    memset( md, 0, sizeof( md ) );
    
    if( SHA1( ( unsigned char * )sign_src.c_str(), sign_src.size(), ( unsigned char * )md ) == NULL )
    {
        //throw WEBEXCEPT( ERR_SHA, "get sha1 failed" );
    }
    
    // ת��Ϊ�ַ���
    char buff[2 * SHA_DIGEST_LENGTH + 1];
    memset( buff, 0, sizeof( buff ) );
    binary2hex( md, SHA_DIGEST_LENGTH, buff );
    
    return string( buff );
}

#if OPENSSL_VERSION_NUMBER < 0x10100000L
/*
 * ��������ԭ������hmac-sha256ǩ��
 */
string gen_hmac_sha256_sign(const string &sign_src, const string &key)
{
    // ���hmac-sha256
    char md[EVP_MAX_MD_SIZE];
    unsigned int len;
    const EVP_MD * engine = NULL;
    engine = EVP_sha256();

    HMAC_CTX ctx;
    HMAC_CTX_init(&ctx);
    HMAC_Init_ex(&ctx, key.c_str(), key.size(), engine, NULL);
    HMAC_Update(&ctx, (unsigned char*) sign_src.c_str(), sign_src.size());

    HMAC_Final(&ctx, (unsigned char*) md, &len);
    HMAC_CTX_cleanup(&ctx);

    // ת��Ϊ�ַ���
    char buff[2 * EVP_MAX_MD_SIZE + 1];
    memset(buff, 0, sizeof(buff));
    binary2hex(md, len, buff);

    return string(buff);
}
#else

/*
 * ��������ԭ������hmac-sha256ǩ��
   https://developer.akamai.com/blog/2017/02/14/upgrade-openssl-110
 */
string gen_hmac_sha256_sign(const string &sign_src, const string &key)
{
    // ���hmac-sha256
    char md[EVP_MAX_MD_SIZE];
    unsigned int len;
    const EVP_MD * engine = NULL;
    engine = EVP_sha256();

	HMAC_CTX *ctx = HMAC_CTX_new();
    HMAC_Init_ex(ctx, key.c_str(), key.size(), engine, NULL);
    HMAC_Update(ctx, (unsigned char*) sign_src.c_str(), sign_src.size());

    HMAC_Final(ctx, (unsigned char*) md, &len);
	HMAC_CTX_free(ctx);

    // ת��Ϊ�ַ���
    char buff[2 * EVP_MAX_MD_SIZE + 1];
    memset(buff, 0, sizeof(buff));
    binary2hex(md, len, buff);

    return string(buff);
}
#endif

#if OPENSSL_VERSION_NUMBER < 0x10100000L
/*
 * ��������ԭ������hmac-sha256ǩ��
 */
string gen_hmac_sha256_sign_raw(const string &sign_src, const string &key)
{
    // ���hmac-sha256
    char md[EVP_MAX_MD_SIZE];
    unsigned int len;
    const EVP_MD * engine = NULL;
    engine = EVP_sha256();

    HMAC_CTX ctx;
    HMAC_CTX_init(&ctx);
    HMAC_Init_ex(&ctx, key.c_str(), key.size(), engine, NULL);
    HMAC_Update(&ctx, (unsigned char*) sign_src.c_str(), sign_src.size());

    HMAC_Final(&ctx, (unsigned char*) md, &len);
    HMAC_CTX_cleanup(&ctx);

    return string(md, len);
}
#else

/*
 * ��������ԭ������hmac-sha256ǩ��
   https://developer.akamai.com/blog/2017/02/14/upgrade-openssl-110
 */
string gen_hmac_sha256_sign_raw(const string &sign_src, const string &key)
{
    // ���hmac-sha256
    char md[EVP_MAX_MD_SIZE];
    unsigned int len;
    const EVP_MD * engine = NULL;
    engine = EVP_sha256();

	HMAC_CTX *ctx = HMAC_CTX_new();
    HMAC_Init_ex(ctx, key.c_str(), key.size(), engine, NULL);
    HMAC_Update(ctx, (unsigned char*) sign_src.c_str(), sign_src.size());

    HMAC_Final(ctx, (unsigned char*) md, &len);
	HMAC_CTX_free(ctx);

    return string(md, len);
}
#endif

/*
 * charת��Ϊ16����
 */
string char2hex( char c )
{
    std::string result;
    char first, second;
    
    first = ( c & 0xF0 ) / 16;
    first += first > 9 ? 'A' - 10 : '0';
    second = c & 0x0F;
    second += second > 9 ? 'A' - 10 : '0';
    
    result.append( 1, first );
    result.append( 1, second );
    
    return result;
}

/*
 * ������ת��Ϊʮ�������ַ���
 */
void binary2hex( char *bin, int binlen, char *dest )
{
    string tmp;
    
    for( int i = 0; i < binlen; i++ )
    {
        tmp = char2hex( bin[i] );
        dest[i * 2] = tmp[0];
        dest[i * 2 + 1] = tmp[1];
    }
}

/*
 * ��ȡ��ǰ������
 */
string GetMonthDate()
{
    struct tm *tm_ptr;
    time_t now = time( NULL );
    tm_ptr = localtime( &now );
    char szTransDate[16] = {0} ;
    snprintf( szTransDate, sizeof( szTransDate ) - 1, "%02d��%02d��", tm_ptr->tm_mon + 1, tm_ptr->tm_mday );
    
    return string( szTransDate ) ;
}


	
string GetTodayDate()
{
	char szDate[128];
	time_t the_time;
	struct tm *tm_ptr;

	the_time = time(NULL);
	tm_ptr = localtime(&the_time);
	snprintf(szDate, sizeof(szDate) - 1, "%04d%02d%02d",
		tm_ptr->tm_year + 1900, tm_ptr->tm_mon + 1, tm_ptr->tm_mday);
	return szDate;
}





string delete_substring( string src, const string &sub_string )
{
    size_t pos;
    pos = src.find( sub_string, 0 );
    
    if( pos == string::npos )
    {
        return src;
    }
    else
    {
        return src.substr( 0, pos );
    }
}

std::string genSHA1Sign( const std::string &strSrc )
{
    unsigned char hash[20];
    char outputBuffer[41] = {0};
    SHA_CTX sha1;
    SHA1_Init( &sha1 );
    SHA1_Update( &sha1, strSrc.c_str(), strSrc.length() );
    SHA1_Final( hash, &sha1 );
    int i = 0;
    
    for( i = 0; i < 20; i++ )
    {
        snprintf( outputBuffer + ( i * 2 ), 2, "%02x", hash[i] );
    }
    
    binary2hex( ( char * )hash, 20, outputBuffer );
    
    return outputBuffer;
}

std::string genSHA256Sign( const std::string &strSrc )
{
    unsigned char hash[32];
    char outputBuffer[65] = {0};
    SHA256_CTX sha256;
    SHA256_Init( &sha256 );
    SHA256_Update( &sha256, strSrc.c_str(), strSrc.length() );
    SHA256_Final( hash, &sha256 );
    int i = 0;
    
    for( i = 0; i < 32; i++ )
    {
        snprintf( outputBuffer + ( i * 2 ), 2, "%02x", hash[i] );
    }
    
    binary2hex( ( char * )hash, 32, outputBuffer );
    
    return outputBuffer;
}

void getRawMap(const string &strRawQryData, CStr2Map &rawMap)
{
    std::string::size_type iStart = 0;
    std::string::size_type iTmp;
    for(iTmp = strRawQryData.find("&");
        iTmp != std::string::npos;
        iTmp = strRawQryData.find("&", iStart))
    {
        string strSub = strRawQryData.substr(iStart, iTmp - iStart);
        std::string::size_type pos = strSub.find("=");
        if (pos != std::string::npos)
        {
            string key = strSub.substr(0, pos);
            string value = strSub.substr(pos + 1, strSub.size() - pos - 1);
            rawMap[key] = value;
        }
        iStart = iTmp + 1;
    }

    string strSub = strRawQryData.substr(iStart);
    std::string::size_type pos = strSub.find("=");
    if (pos != std::string::npos)
    {
        string key = strSub.substr(0, pos);
        string value = strSub.substr(pos + 1, strSub.size() - pos - 1);
        rawMap[key] = value;
    }
}


//  ����ƴ�ӣ� �� urlEncode 
string urlEncodeForBody(CStr2Map &reqMap, bool urlEncode)
{
    string result = "";
    int count = 0;

    CStr2Map::iterator iter = reqMap.begin();
    for ( ; iter != reqMap.end(); ++iter)
    {
        count++;
        result += iter->first;
        result += "=";
        if(urlEncode){
            result += regUrlEncode(iter->second);
        }else{
            result += iter->second;
        }

        if (count < (int)reqMap.size())
        {
            result += "&";
        }
    }

    return result;
}

//// ���㲢ƴ��΢���ύ���Ƹ�ͨ��ǩ��
//string get_weixin_package(CStr2Map &reqMap)
//{
//    // ĩβ��ƴ�� &
//    string toSignStr = get_weixin_package_string1(reqMap, false);
//    string sign = CreateIaSign(reqMap["merchant_code"], reqMap);
//
//    string urlencode_result = get_weixin_package_string1(reqMap, false);
//    urlencode_result += "&";
//    urlencode_result += "sign";
//    urlencode_result += "=";
//    urlencode_result += sign;
//
//    return urlencode_result;
//}
//
////����spid ���̻����,md5src �ǲ���ǩ����map
//string CreateIaSign(const string &spid, const CStr2Map &md5src)
//{
//    if (spid.empty() || md5src.empty())
//    {
//        return "";
//    }
//
//    bool first = true;
//    string md5 = "";
//    CStr2Map::const_iterator it = md5src.begin();
//    for (; it != md5src.end(); ++it)
//    {
//        if (it->second.empty())
//        {
//            continue;   
//        }
//
//        if (first)
//        {
//            md5 = it->first + "=" + it->second;
//            first = false;
//        }
//        else
//        {
//            md5 += "&" + it->first + "=" + it->second;
//        }
//    }
//
//    if (md5.empty())
//    {
//        return "";
//    }
//
//    g_RuntimeGather.SaveLog(DEBUG, "[%s,%d] CreateSign src=[%s]", __FILE__, __LINE__, md5.c_str());
//
//	InfoLog("CreateIaSign, spid=[%s], sign_src=[%s]", spid.c_str(), md5.c_str());
//
//    //ͨ������Զ�̹���һ��ǩ��
//    CStr2Map inMap;
//    inMap["spid"] = spid;
//    inMap["sign_src"] = md5;
//    inMap["sign_type"] = "SHA-1";
//    inMap["business_type"] = "1";
//    inMap["client_ip"] = "127.0.0.1";
//
//    CStr2Map outMap;
//    RPC::getInst()->call(relay_100439_ia_ui_gensign_service, inMap, outMap);
//    if (outMap["result"] != "0")
//    {
//        ErrorLog("gensign failed, result = %s, res_info = %s.", outMap["result"].c_str(), outMap["res_info"].c_str());
//        throw WEBEXCEPT(atoi(outMap["result"].c_str()), outMap["res_info"].c_str());
//    }
//	InfoLog("CreateIaSign success, sign=[%s]", outMap["sign"].c_str());
//    
//    return Tools::upper(outMap["sign"]);    
//}



string sha256(const string& strSrc)
{
    if (strSrc.empty())
    {
        return "";
    }
    
    unsigned char szDest[32 + 1] = {0};
    SHA256((const unsigned char *)(strSrc.c_str()), strSrc.length(), szDest);
     // ת��Ϊ�ַ���
    char buff[64 + 1] = {0};
    binary2hex((char *)szDest, 32, buff );
    
    return string( buff );
}


/**
 * ��β�Ҫ���������ַ�
 */
string replaceSpecialChar(const string &strSrc)
{
    int iLen = strSrc.length();

    if (strSrc.empty() || 0 == iLen)
    {
        InfoLog("Input string is empty!");
        return "";
    }

    string strDst = strSrc;

    for (int i = 0; i < iLen; ++i)
    {
        char cTmp = strDst[i];
        bool bLegalCharFlag = (cTmp >= 'a' && cTmp <= 'z') 
                                || (cTmp >= 'A' && cTmp <= 'Z') 
                                || (cTmp >= '0' && cTmp <= '9') 
                                || (cTmp == '.');
        if (!bLegalCharFlag)
        {
            strDst[i] = ' ';
        }
    }

    strDst.erase(0, strDst.find_first_not_of(" "));
    strDst.erase(strDst.find_last_not_of(" ") + 1);

    InfoLog("strSrc string is [%s], strDst string is [%s]", strSrc.c_str(), strDst.c_str());
    return strDst;
}

/**
 * ֧�������ַ�
 */
string replaceSpecialWchar(const string &strSrc, const string &locale/* = "zh_CN.UTF-8"*/)
{
    int iLen = strSrc.length();

    if (strSrc.empty() || 0 == iLen)
    {
        InfoLog("Input string is empty!");
        return "";
    }

    if(iLen > 128)
    {
        ErrorLog("src string is too long, iLen: %d", iLen);
        return strSrc;
    }

    char *pOldLocale = setlocale(LC_ALL, NULL);
    if (NULL == pOldLocale)
    {
        ErrorLog("Get old locale info failed!");
    }
    setlocale(LC_ALL, locale.c_str());
    wchar_t wcsDst[128];
    wmemset(wcsDst, 0, sizeof(wcsDst) / sizeof(wchar_t));
    mbstowcs(wcsDst, strSrc.c_str(), iLen);

    for (int i = 0; i < (int)wcslen(wcsDst); ++i)
    {
        wchar_t wcTmp = wcsDst[i];
        bool bLegalCharFlag = (wcTmp >= L'a' && wcTmp <= L'z') 
                                || (wcTmp >= L'A' && wcTmp <= L'Z') 
                                || (wcTmp >= L'0' && wcTmp <= L'9') 
                                || (wcTmp == L'.');
        if (!bLegalCharFlag)
        {
            wcsDst[i] = L' ';
        }
    }

    char cDst[512] = {0};
    wcstombs(cDst, wcsDst, sizeof(wcsDst));
    string strDst = cDst;

    strDst.erase(0, strDst.find_first_not_of(" "));
    strDst.erase(strDst.find_last_not_of(" ") + 1);

    InfoLog("strSrc string is [%s], strDst string is [%s]", strSrc.c_str(), strDst.c_str());
    setlocale(LC_ALL, pOldLocale);
    return strDst;
}

/**
 * ��ȡMD5ժҪ
 */
char* getMd5(const char *key, int len, char *szRes, int iResSize)
{
    MD5_CTX md5c;
    unsigned char digest[16];	
    MD5_Init(&md5c);
    MD5_Update(&md5c, key, len);
    MD5_Final(digest, &md5c);
    
    for (int i = 0; i < 16; i++) 
    {
        snprintf(szRes + i * 2, iResSize - i * 2, "%02x", digest[i]);
    }

    szRes[32] = '\0';
    return szRes;
}

string getMd5(const string &srcText)
{
    char md5_buf[32 + 1] = {0};
    memset(md5_buf, 0, sizeof(md5_buf));
    
    getMd5(srcText.c_str(), srcText.length(), md5_buf, sizeof(md5_buf));

    return md5_buf;
}

string appendUrl(const string& url, const string& str)
{
    std::string s = url;

    if (url.find('?') == std::string::npos)
        s += '?';

    char chLast = *(s.rbegin());
    if (chLast != '?' && chLast != '&')
        s += '&';

    s += str;
    return s;
}


// ĩβ��ƴ�� & 
string getSignStr(CStr2Map &reqMap, bool urlEncode)
{
    string result = "";
    int count = 0;

    CStr2Map::iterator iter = reqMap.begin();
    for ( ; iter != reqMap.end(); ++iter)
    {
        count++;
        result += iter->first;
        result += "=";
        if(urlEncode){
            result += regUrlEncode(iter->second);
        }else{
            result += iter->second;
        }

        if (count < reqMap.size())
        {
            result += "&";
        }
    }

    return result;
}


