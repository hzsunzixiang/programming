	////////////////////////////////////////////////////////////////////////////////


#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <arpa/inet.h>

#define  PACKET_BUFFER_SIZE 100

#define  PACKET_HEADER_SIZE 13 

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
void _begin1(short nCmdType, char cVersion, char cSubVersion)
{
	_reset();
	//short tmp = htons(nCmdType);
	//_writeHeader((char*)&tmp, sizeof(short), offset);// 命令码
	_writeHeader("IC", sizeof(char)*2, 0);// 命令码
	_writeHeader((char*)&nCmdType, sizeof(short), 2);// 命令码
	_writeHeader(&cVersion, sizeof(char), 4);		// 主版本号
	_writeHeader(&cSubVersion, sizeof(char), 5);	// 子版本号
}
//	_begin(600, 15, 16, 1000, 0x1234567890);
void _begin(short nCmdType, char cVersion, char cSubVersion, int extent, int64_t ext2)
{
	_reset();
	size_t offset = 0;
	_writeHeader("IC", sizeof(char)*2, offset);// 命令码
	offset += 2; 
	// 转换为网络字节序
	short nCmdType_net = htons(nCmdType);
	_writeHeader((char*)&nCmdType_net, sizeof(short), offset);// 命令码
	offset += 2; 
	_writeHeader(&cVersion, sizeof(char), offset);		// 主版本号
	offset += 1; 
	_writeHeader(&cSubVersion, sizeof(char), offset);	
	offset += 1; 
	_writeHeader((char *)&extent, sizeof(int), offset);	
	offset += sizeof(int); 
	_writeHeader((char *)&ext2, sizeof(int64_t), offset);	
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
	_begin(0x56, 0x15, 0x16, 0x1000, 0x1234567890);
	char version =  GetVersion();
	printf("version:%d\n\n", version);
	FILE* f = fopen("test1.bin", "w+");
	fwrite(&m_strBuf, sizeof(m_strBuf), 1, f);

	return 0;
}

// 0x0056 被转换为大端字节的时候

// stephensun@debian:~/programming/linux/memcpy$ hexdump -C test1.bin
// 00000000  49 43 00 56 15 16 00 10  00 00 90 78 56 34 12 00  |IC.V.......xV4..|
// 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
// *
// 00000064

// (gdb) x/2xb &nCmdType
// 0x7fffffffdfbc: 0x56    0x00
// (gdb) x/2xb &nCmdType_net
// 0x7fffffffdfc6: 0x00    0x56
// (gdb) x/16xb m_strBuf
// 0x600f80 <m_strBuf>:    0x49    0x43    0x00    0x56    0x00    0x00    0x00    0x00
// 0x600f88 <m_strBuf+8>:  0x00    0x00    0x00    0x00    0x00    0x00    0x00    0x00

