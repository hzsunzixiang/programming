#include <stdio.h>

#include <stdio.h>
#ifndef ALL_SIZE_FUNC
#define ALL_SIZE_FUNC(num, data)    \
	unsigned int allSize() const {\
		return sizeof(*this) + (num) * sizeof(data[0]);\
	}
#endif

#ifndef DATA_SIZE_FUNC
#define DATA_SIZE_FUNC(num, data)       \
	unsigned int dataSize() const { \
		return (num) * sizeof(data[0]); \
	}
#endif

#pragma pack(1)
struct ICExternalHeader {
	char magic[2];
	unsigned short cmd;
	unsigned char ver;
	unsigned char subver;
	unsigned short bodylen;
	char checksum;
	unsigned int sequence;
	char data[0];
	ALL_SIZE_FUNC(bodylen, data);
	DATA_SIZE_FUNC(bodylen, data);
};
#pragma pack()

#pragma pack(1)
struct ICExternalHeader2 {
	char data[0];
	//ALL_SIZE_FUNC(bodylen, data);
	//DATA_SIZE_FUNC(bodylen, data);
};
#pragma pack()

#pragma pack(1)
struct ICExternalHeader3 {
	char data1[1];
	char data[0];
	//ALL_SIZE_FUNC(bodylen, data);
	//DATA_SIZE_FUNC(bodylen, data);
};
#pragma pack()

// c语言不支持这种写法
static const unsigned int IC_PACKET_HEADER_LENGTH       = sizeof(ICExternalHeader);

int main()
{
	char data[0];
	printf("size:%u, size:%lu, size2:%lu, size3:%lu\n", 
			IC_PACKET_HEADER_LENGTH, sizeof(data[0]), sizeof(ICExternalHeader2), sizeof(ICExternalHeader3));
	return 0;
}

//  #define ALL_SIZE_FUNC(num,data) unsigned int allSize() const { return sizeof(*this) + (num) * sizeof(data[0]); }
//  
//  #define DATA_SIZE_FUNC(num,data) unsigned int dataSize() const { return (num) * sizeof(data[0]); }
//  
//  #pragma pack(1)
//  struct ICExternalHeader {
//  	char magic[2];
//  	unsigned short cmd;
//  	unsigned char ver;
//  	unsigned char subver;
//  	unsigned short bodylen;
//  	char checksum;
//  	unsigned int sequence;
//  	char data[0];
//  	unsigned int allSize() const { return sizeof(*this) + (bodylen) * sizeof(data[0]); };
//  	unsigned int dataSize() const { return (bodylen) * sizeof(data[0]); };
//  };
//  #pragma pack()
//  
