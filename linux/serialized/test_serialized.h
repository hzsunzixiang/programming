
#ifndef TEST_SERIALIZED_H
#define TEST_SERIALIZED_H


#include "intf_serializable.h"
#include <string>
#include <sstream>
#include <iostream>
#include <stdexcept>


namespace testing 
{


	class TestApp : public ISerializable
	{
		public:
			std::string m_sLastErrMsg;///<错误信息

			/**
			 * 版本
			 *
			 * 版本 >= 0
			 */
			uint32_t dwVersion;

			/**
			 * 是否设置版本
			 *
			 * 版本 >= 0
			 */
			uint8_t cVersion_u;

			/**
			 * 用户ID
			 *
			 * 版本 >= 0
			 */
			uint64_t ddwUid;

			/**
			 * 是否设置用户ID
			 *
			 * 版本 >= 0
			 */
			uint8_t cUid_u;

			/**
			 * 可领取的默认券个数,负数表示不可用
			 *
			 * 版本 >= 0
			 */




			/**
			 * 手机号码
			 *
			 * 版本 >= 0
			 */
			std::string strMobile;

			/**
			 * 是否设置手机号码
			 *
			 * 版本 >= 0
			 */
			uint8_t cMobile_u;
		public:
			TestApp():
				dwVersion(0),
				cVersion_u(0),
				ddwUid(0),
				cUid_u(0),
				strMobile(""),
				cMobile_u(0){}
			TestApp& operator = (const TestApp& obj){

				this->dwVersion = obj.dwVersion;
				this->cVersion_u = obj.cVersion_u;
				this->ddwUid = obj.ddwUid;
				this->cUid_u = obj.cUid_u;
				this->strMobile = obj.strMobile;
				this->cMobile_u = obj.cMobile_u;
				return *this;
			}

		public:
			/**
			 * 是否设置版本了
			 * 
			 * @param uint32_t:dwVersion
			 *  
			 * 
			 */
			bool  IsVersionSet() const{
				return  cVersion_u != 0;
			}


			/**
			 * 获取uflag版本了
			 * 
			 * @param uint32_t:dwVersion
			 *  
			 * 
			 */
			const uint8_t   GetVersionUFlag() const{
				return  cVersion_u;
			}


			/**
			 * 设置版本
			 * 
			 * @param uint32_t:dwVersion
			 *  
			 * 
			 */
			void  SetVersion( const uint32_t& sVal, uint8_t cUFlag=1){
				dwVersion = sVal;
				cVersion_u = cUFlag;
			}


			/**
			 * 获取版本
			 * 
			 * @return dwVersion value 类型为:uint32_t
			 * 
			 */
			const uint32_t&  GetVersion() const {
				return dwVersion;
			}


			/**
			 * 设置是否设置版本
			 * 
			 * 此字段的版本 >= 0
			 * @param uint8_t:cVersion_u
			 *  
			 * 
			 */
			void  SetVersion_u( const uint8_t& sVal){
				cVersion_u = sVal;
			}


			/**
			 * 获取是否设置版本
			 * 
			 * @return cVersion_u value 类型为:uint8_t
			 * 
			 */
			const uint8_t&  GetVersion_u() const {
				return cVersion_u;
			}


			/**
			 * 是否设置用户ID了
			 * 
			 * @param uint64_t:ddwUid
			 *  
			 * 
			 */
			bool  IsUidSet() const{
				return  cUid_u != 0;
			}


			/**
			 * 获取uflag用户ID了
			 * 
			 * @param uint64_t:ddwUid
			 *  
			 * 
			 */
			const uint8_t   GetUidUFlag() const{
				return  cUid_u;
			}


			/**
			 * 设置用户ID
			 * 
			 * @param uint64_t:ddwUid
			 *  
			 * 
			 */
			void  SetUid( const uint64_t& sVal, uint8_t cUFlag=1){
				ddwUid = sVal;
				cUid_u = cUFlag;
			}


			/**
			 * 获取用户ID
			 * 
			 * @return ddwUid value 类型为:uint64_t
			 * 
			 */
			const uint64_t&  GetUid() const {
				return ddwUid;
			}


			/**
			 * 设置是否设置用户ID
			 * 
			 * 此字段的版本 >= 0
			 * @param uint8_t:cUid_u
			 *  
			 * 
			 */
			void  SetUid_u( const uint8_t& sVal){
				cUid_u = sVal;
			}


			/**
			 * 获取是否设置用户ID
			 * 
			 * @return cUid_u value 类型为:uint8_t
			 * 
			 */
			const uint8_t&  GetUid_u() const {
				return cUid_u;
			}











			/**
			 * 是否设置手机号码了
			 * 
			 * @param std::string:strMobile
			 *  
			 * 
			 */
			bool  IsMobileSet() const{
				return  cMobile_u != 0;
			}


			/**
			 * 获取uflag手机号码了
			 * 
			 * @param std::string:strMobile
			 *  
			 * 
			 */
			const uint8_t   GetMobileUFlag() const{
				return  cMobile_u;
			}


			/**
			 * 设置手机号码
			 * 
			 * @param std::string:strMobile
			 *  
			 * 
			 */
			void  SetMobile( const std::string& sVal, uint8_t cUFlag=1){
				strMobile = sVal;
				cMobile_u = cUFlag;
			}


			/**
			 * 获取手机号码
			 * 
			 * @return strMobile value 类型为:std::string
			 * 
			 */
			const std::string&  GetMobile() const {
				return strMobile;
			}


			/**
			 * 获取手机号码
			 * 
			 * @return strMobile value 类型为:std::string
			 * 
			 */
			std::string&  GetMobile() {
				return strMobile;
			}


			/**
			 * 设置是否设置手机号码
			 * 
			 * 此字段的版本 >= 0
			 * @param uint8_t:cMobile_u
			 *  
			 * 
			 */
			void  SetMobile_u( const uint8_t& sVal){
				cMobile_u = sVal;
			}


			/**
			 * 获取是否设置手机号码
			 * 
			 * @return cMobile_u value 类型为:uint8_t
			 * 
			 */
			const uint8_t&  GetMobile_u() const {
				return cMobile_u;
			}


			virtual bool Serialize(CByteStreamNetwork& bs){

				uint32_t dwMyLen = 0;
				if(bs.isStoring()) //for write in buffer
				{
					//can not larger than 1 M.
					CByteStreamNetwork bsDummy(NULL, 1024 * 1024, false);
					//bsDummy for precheck the xo size...
					bsDummy.isStoring(true);
					Serialize_i(bsDummy);
					dwMyLen = bsDummy.getWrittenLength();
					bs & dwMyLen;
					printf("====the length will be serialized:%d\n", dwMyLen);
					Serialize_i(bs);
				}
				else
				{    //for read from buffer
					bs & dwMyLen;
					uint32_t dwReadedLen = bs.getReadLength();
					Serialize_i(bs);
					dwReadedLen = bs.getReadLength() - dwReadedLen;
					// dwReadedLen for the size of xo
					if( dwReadedLen > dwMyLen ){
						return false;
					}

				}
				return bs.isGood();
			}

			bool Serialize_i(CByteStreamNetwork& bsTmp){

				bsTmp & dwVersion; // 序列化版本 类型为uint32_t
				bsTmp & cVersion_u; // 序列化是否设置版本 类型为uint8_t
				bsTmp & ddwUid; // 序列化用户ID 类型为uint64_t
				bsTmp & cUid_u; // 序列化是否设置用户ID 类型为uint8_t
				bsTmp & strMobile; // 序列化手机号码 类型为String
				bsTmp & cMobile_u; // 序列化是否设置手机号码 类型为uint8_t
				return bsTmp.isGood();
			}
			virtual bool Serialize_mem(CByteStreamMemory& bs){

				uint32_t dwMyLen = 0;
				if(bs.isStoring()) //for write in buffer
				{
					//can not larger than 1 M.
					CByteStreamMemory bsDummy(NULL, 1024 * 1024, false);
					//bsDummy for precheck the xo size...
					bsDummy.isStoring(true);
					Serialize_imen(bsDummy);
					dwMyLen = bsDummy.getWrittenLength();
					bs & dwMyLen;
					printf("====the length will be serialized:%d\n", dwMyLen);
					Serialize_imen(bs);
				}
				else
				{    //for read from buffer
					bs & dwMyLen;
					uint32_t dwReadedLen = bs.getReadLength();
					Serialize_imen(bs);
					dwReadedLen = bs.getReadLength() - dwReadedLen;
					// dwReadedLen for the size of xo
					if( dwReadedLen > dwMyLen ){
						return false;
					}

				}
				return bs.isGood();
			}

			bool Serialize_imen(CByteStreamMemory& bsTmp){

				bsTmp & dwVersion; // 序列化版本 类型为uint32_t
				bsTmp & cVersion_u; // 序列化是否设置版本 类型为uint8_t
				bsTmp & ddwUid; // 序列化用户ID 类型为uint64_t
				bsTmp & cUid_u; // 序列化是否设置用户ID 类型为uint8_t
				bsTmp & strMobile; // 序列化手机号码 类型为String
				bsTmp & cMobile_u; // 序列化是否设置手机号码 类型为uint8_t
				return bsTmp.isGood();
			}

			const char* GetLastErrMsg() const{
				return m_sLastErrMsg.c_str();
			}




			void DumpData(std::ostream& oss) const{

				oss<<"[dwVersion:"<<dwVersion<<"] ";
				oss<<"[cVersion_u:"<<(int)cVersion_u<<"] ";
				oss<<"[ddwUid:"<<ddwUid<<"] ";
				oss<<"[cUid_u:"<<(int)cUid_u<<"] ";
				oss<<"[strMobile:"<<strMobile<<"] ";
				oss<<"[cMobile_u:"<<(int)cMobile_u<<"] ";

			}

			template<typename T>
				T & DumpPlusData(T& oss){
					oss<<"dwVersion:"<<dwVersion;
					oss<<"cVersion_u:"<<cVersion_u;
					oss<<"ddwUid:"<<ddwUid;
					oss<<"cUid_u:"<<cUid_u;
					oss<<"strMobile:"<<strMobile;
					oss<<"cMobile_u:"<<cMobile_u;
					return oss;
				}


			//提供ToString借口，默认为DumpData格式，请按需要进行修改
			std::string ToString() const{
				std::stringstream ss;
				DumpData(ss);
				return ss.str();
			}



	};
}

#endif /* TEST_SERIALIZED_H */
