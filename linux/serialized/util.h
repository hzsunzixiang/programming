#ifndef __RANKINFO_CACHE_UTIL_H_
#define __RANKINFO_CACHE_UTIL_H_

#include <string>
#include <sstream>
#include <iostream>
#include "app_platform/intf_serializable.h"
#include "libc2c/c2c_errno_define.h"


namespace c2cent
{
namespace dao
{
namespace couponcache 
{
namespace util
{

class CouponInfoCacheUtil {

public:
    template<class T>
    static uint32_t Deserialize(const std::string& strValue, T& oT) {
        uint32_t dwRet = 0;

        CByteStreamNetwork bs(const_cast<char *>(strValue.data()), strValue.length());

        bs.isStoring(false);
        if (!oT.Serialize(bs)) {
            return PAIMI_ERR_DESERIALIZE_FAILED;  // 直接复用paimi的错误码
        }

        return dwRet;
    }

    template<class T>
    static uint32_t Serialize(const T& oT, std::string& strRes) {
        T oTs = oT;
        uint32_t dwRet = 0;

        char buf[2048] = { 0 };
        CByteStreamNetwork bs(buf, sizeof(buf));

        bs.isStoring(true);
        if (!oTs.Serialize(bs)) {
            return PAIMI_ERR_SERIALIZE_FAILED;
        }

        strRes.assign(buf, bs.getWrittenLength());
        return dwRet;
    }

    inline
    static std::string& GenerateCacheInfoKey(uint64_t ddwUserId, std::string& strKey) {
        
        std::stringstream ossTmp;
        ossTmp << "newpaipaicoupon:" << ddwUserId;
        strKey = ossTmp.str();
        return strKey;
    }
    inline
    static std::string& GenerateMobileKey(std::string strMobile, std::string& strKey) {
        
        std::stringstream ossTmp;
        ossTmp << "newpaipaimobile:" << strMobile;
        strKey = ossTmp.str();
        return strKey;
    }

    template<class F, class T>
    static T& convertType(const F& f, T& t) {
        
        std::stringstream ossTmp;
        ossTmp << f;
        ossTmp >> t;
        return t;
    }
};
    
}
}
}
}


#endif
