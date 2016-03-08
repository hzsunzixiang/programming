#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <string>
#include "byte_stream.h"
#include "test_serialized.h"



template<class T>
static uint32_t Deserialize_mem(const std::string& strValue, T& oT) {
	uint32_t dwRet = 0;

	CByteStreamMemory bs(const_cast<char *>(strValue.data()), strValue.length());

	bs.isStoring(false);
	if (!oT.Serialize_mem(bs)) {
		return 1;  
	}

	return dwRet;
}

template<class T>
static uint32_t Serialize_mem(const T& oT, std::string& strRes) {
	T oTs = oT;
	uint32_t dwRet = 0;

	char buf[2048] = { 0 };
	CByteStreamMemory bs(buf, sizeof(buf));

	bs.isStoring(true);
	if (!oTs.Serialize_mem(bs)) {
		return 1;
	}

	strRes.assign(buf, bs.getWrittenLength());
	return dwRet;
}


int main()
{
	std::string strValue;
	testing::TestApp testApp;
	uint32_t version = 12345678;
	uint64_t uid = 17842379;
	testApp.SetVersion(version);
	testApp.SetUid(uid);
	std::string mobile = "18658168739";
	testApp.SetMobile(mobile);

	printf("--%x, %lx, \n", version, uid); 
	printf("--%s--\n", testApp.ToString().c_str());
	uint32_t dwRet;
	dwRet = ::Serialize_mem(testApp, strValue);
	if (dwRet != 0) {
		printf("Serialize error!\n");
		return dwRet;
	}

	//_begin(100, 31, 7);
	FILE* f = fopen("test_mem.bin", "w+");
	fwrite(strValue.c_str(), strValue.size(), 1, f);


	testing::TestApp testApp_r;
	dwRet = ::Deserialize_mem(strValue, testApp_r);
	if (dwRet != 0) {
		printf("Deserialize error!\n");
		return dwRet;
	}
	printf("--%s--\n", testApp_r.ToString().c_str());
	return 0;
}

// 注意 uint64_t 的序列化方式， 是转换成16进制存储的(然后以字符串的形式输出)，而不是二进制 
// 



// 本地内存版
// StephenSun@192.168.202.90:~/program/serialized$ ./main_men
// --bc614e, 11040cb,
// --[dwVersion:12345678] [cVersion_u:1] [ddwUid:17842379] [cUid_u:1] [strMobile:18658168739] [cMobile_u:1] --
// ====the length will be serialized:39
// --[dwVersion:12345678] [cVersion_u:1] [ddwUid:17842379] [cUid_u:1] [strMobile:18658168739] [cMobile_u:1] --
// StephenSun@192.168.202.90:~/program/serialized$ hexdump -C test_mem.bin
// 00000000  27 00 00 00 4e 61 bc 00  01 30 30 30 30 30 30 30  |'...Na...0000000|
// 00000010  30 30 31 31 30 34 30 63  62 00 01 0b 00 00 00 31  |0011040cb......1|
// 00000020  38 36 35 38 31 36 38 37  33 39 01                 |8658168739.|
// 0000002b

// 网络版
// StephenSun@192.168.202.90:~/program/serialized$ ./main_net
// --bc614e, 11040cb,
// --[dwVersion:12345678] [cVersion_u:1] [ddwUid:17842379] [cUid_u:1] [strMobile:18658168739] [cMobile_u:1] --
// ====the length will be serialized:39
// --[dwVersion:12345678] [cVersion_u:1] [ddwUid:17842379] [cUid_u:1] [strMobile:18658168739] [cMobile_u:1] --
// StephenSun@192.168.202.90:~/program/serialized$ hexdump -C test_net.bin
// 00000000  00 00 00 27 00 bc 61 4e  01 30 30 30 30 30 30 30  |...'..aN.0000000|
// 00000010  30 30 31 31 30 34 30 63  62 00 01 00 00 00 0b 31  |0011040cb......1|
// 00000020  38 36 35 38 31 36 38 37  33 39 01                 |8658168739.|
// 0000002b
// 
