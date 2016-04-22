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
//	_begin(600, 15, 16, 1000, 0x1234567890);
void _begin(short nCmdType, char cVersion, char cSubVersion, int extent, int64_t ext2)
{
	_reset();
	size_t offset = 0;
	_writeHeader("IC", sizeof(char)*2, offset);// 命令码
	offset += 2; 
	_writeHeader((char*)&nCmdType, sizeof(short), offset);// 命令码
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
	_begin(0x56, 0x15, 0x16, 0x1000, 0x1234567890);
	char version =  GetVersion();
	printf("version:%d\n\n", version);
	FILE* f = fopen("test.bin", "w+");
	fwrite(&m_strBuf, sizeof(m_strBuf), 1, f);

	return 0;
}


//	_begin(0x56, 0x15, 0x16, 0x1000, 0x1234567890);

// 转换成小端字节的形式 以short的形式 取出, 也就是说如果把每两位强制转换成short 就是现在看到的情形 
// 两个字节中高位在前 低位在后
//	stephensun@debian:~/programming/linux/memcpy$ hexdump test.bin
//	0000000 4349 0056 1615 1000 0000 7890 3456 0012
//	0000010 0000 0000 0000 0000 0000 0000 0000 0000
//	*
//	0000064

// 严格按照bit位 从内从中低字节 向高字节, 逐个取出 

// stephensun@debian:~/programming/linux/memcpy$ hexdump -C test.bin
// 00000000  49 43 56 00 15 16 00 10  00 00 90 78 56 34 12 00  |ICV........xV4..|
// 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
// *
// 00000064


// stephensun@debian:~/programming/linux/memcpy$ xxd  -b test.bin
// 0000000: 01001001 01000011 01010110 00000000 00010101 00010110  ICV...
// 0000006: 00000000 00010000 00000000 00000000 10010000 01111000  .....x
// 000000c: 01010110 00110100 00010010 00000000 00000000 00000000  V4....

// gdb 调试情形
// 如果按byte打印 注意小端字节顺序
// (gdb) x/10xb m_strBuf
// 0x600f40 <m_strBuf>:    0x49    0x43    0x56    0x00    0x00    0x00    0x00    0x00
// 0x600f48 <m_strBuf+8>:  0x00    0x00
// (gdb) x/10xh m_strBuf
// 0x600f40 <m_strBuf>:    0x4349  0x0056  0x0000  0x0000  0x0000  0x0000  0x0000  0x0000
// 0x600f50 <m_strBuf+16>: 0x0000  0x0000
// 

// (gdb) print/x  *(short *)m_strBuf
// $5 = 0x4349
//(gdb) print/x  *((short *)m_strBuf + 1)
//$6 = 0x56


// (gdb) x/16xb m_strBuf
// 0x600f40 <m_strBuf>:    0x49    0x43    0x56    0x00    0x15    0x16    0x00    0x10
// 0x600f48 <m_strBuf+8>:  0x00    0x00    0x90    0x78    0x56    0x34    0x12    0x00
