	////////////////////////////////////////////////////////////////////////////////


#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <arpa/inet.h>

#define  PACKET_BUFFER_SIZE 100

#define  PACKET_HEADER_SIZE 50 

char m_strBuf[PACKET_BUFFER_SIZE];	// 报文包缓存

// /////////////////////////////////////////////////////////////////////////////////
void _reset(void)
{
	memset(m_strBuf, 0, PACKET_BUFFER_SIZE);
}


void _writeHeader(char *pIn, int nLen, int nPos)
{
	if(nPos > 0 || nPos+nLen < PACKET_HEADER_SIZE)
	{
		memcpy(m_strBuf+nPos, pIn, nLen) ;
	}
}
void _begin(short nCmdType, char cVersion, char cSubVersion, int extent, int64_t ext2)
{
	_reset();
	size_t offset = 0;
	_writeHeader("IC", sizeof(char)*2, offset);// 命令码
	offset += 2; 
	short tmp = htons(nCmdType);
	_writeHeader((char*)&tmp, sizeof(short), offset);// 命令码
	offset += 2; 
	_writeHeader(&cVersion, sizeof(char), offset);		// 主版本号
	offset += 1; 
	_writeHeader(&cSubVersion, sizeof(char), offset);	
	offset += 1; 
	_writeHeader((char *)&extent, sizeof(int), offset);	
	offset += sizeof(int); 
	_writeHeader((char *)&ext2, sizeof(int64_t), offset);	
}

void _begin1(short nCmdType, char cVersion, char cSubVersion)
{
	_reset();
	size_t offset = 0;
	_writeHeader("IC", sizeof(char)*2, offset);// 命令码
	offset += 2; 
	_writeHeader((char*)&nCmdType, sizeof(short), offset);// 命令码
	offset += 2; 
	_writeHeader(&cVersion, sizeof(char), offset);		// 主版本号
	offset += 1; 
	_writeHeader(&cSubVersion, sizeof(char), offset);	// 子版本号
}
void _readHeader(char *pOut, int nLen, int nPos)
{
	if(nPos > 0 || nPos+nLen < PACKET_HEADER_SIZE)
	{
		memcpy(pOut, m_strBuf+nPos, nLen) ;
	}
}
short GetCmdType(void)
{
	short nCmdType;
	_readHeader((char*)&nCmdType, sizeof(short), 2);// 命令码
	return nCmdType;
}
char GetVersion(void)
{
	char c;
	_readHeader(&c, sizeof(char), 4);	// 主版本号
	return c;
}
char GetSubVersion(void)
{
	char c;
	_readHeader(&c, sizeof(char), 5);	// 子版本号
	return c;
}
short GetBodyLength(void)
{
	short nLen;
	_readHeader((char*)&nLen, sizeof(short), 6);// 包正文长度
	return nLen;
}
int main()
{
	//_begin(100, 31, 7);
	_begin(600, 15, 16, 1000, 0x1234567890);
	char version =  GetVersion();
	printf("version:%d\n\n", version);
	FILE* f = fopen("test.bin", "w+");
	fwrite(&m_strBuf, sizeof(m_strBuf), 1, f);

	return 0;
}




// StephenSun@192.168.202.90:~/program$ hexdump test.bin
// 0000000 4349 0001 0101 0000 0000 0000 0000 0000 //  _begin(1, 1, 1) 的结果
// 0000010 0000 0000 0000 0000 0000 0000 0000 0000
// *
// 0000060 0000 0000
// 0000064

// StephenSun@192.168.202.90:~/program$ ll test.bin
// -rw-rw-r-- 1 StephenSun devel 100 Jan 24 19:39 test.bin   ----  注意大小是100字节


// StephenSun@192.168.202.90:~/program$ hexdump test.bin // _begin(64, 15, 15);
// 0000000 4349 0040 0f0f 0000 0000 0000 0000 0000
// 0000010 0000 0000 0000 0000 0000 0000 0000 0000
// *
// 0000060 0000 0000
// 0000064






// StephenSun@192.168.202.90:~/program/memcpy$ hexdump test.bin
// 0000000 4349 0040 100f 0000 0000 0000 0000 0000
// 0000010 0000 0000 0000 0000 0000 0000 0000 0000
// *
// 0000060 0000 0000
// 0000064

//  最好用-C 选项  
// StephenSun@192.168.202.90:~/program/memcpy$ hexdump -C test.bin
// 00000000  49 43 40 00 0f 10 00 00  00 00 00 00 00 00 00 00  |IC@.............|
// 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
// *
// 00000060  00 00 00 00                                       |....|
// 00000064


//	_begin(600, 15, 16, 1000, 0x1234567890);


//StephenSun@192.168.202.90:~/program/memcpy$ hexdump  -x  test.bin
//0000000    4349    0258    100f    03e8    0000    7890    3456    0012
//0000010    0000    0000    0000    0000    0000    0000    0000    0000
//*
//0000060    0000    0000
//0000064




// oStephenSun@192.168.202.90:~/program/memcpy$ xxd -b test.bin
// 0000000: 01001001 01000011 01011000 00000010 00001111 00010000  ICX...
// 0000006: 11101000 00000011 00000000 00000000 10010000 01111000  .....x
// 000000c: 01010110 00110100 00010010 00000000 00000000 00000000  V4....
// 0000012: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000018: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 000001e: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000024: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 000002a: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000030: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000036: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 000003c: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000042: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000048: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 000004e: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000054: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 000005a: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000060: 00000000 00000000 00000000 00000000                    ....


// 转换成网络字节序的时候 
// StephenSun@192.168.202.90:~/program/memcpy$ xxd  -b test.bin
// 0000000: 01001001 01000011 00000010 01011000 00001111 00010000  IC.X..
// 0000006: 11101000 00000011 00000000 00000000 10010000 01111000  .....x
// 000000c: 01010110 00110100 00010010 00000000 00000000 00000000  V4....
// 0000012: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000018: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 000001e: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000024: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 000002a: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000030: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000036: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 000003c: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000042: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000048: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 000004e: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000054: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 000005a: 00000000 00000000 00000000 00000000 00000000 00000000  ......
// 0000060: 00000000 00000000 00000000 00000000                    ..
