	////////////////////////////////////////////////////////////////////////////////


#include <string.h>
#include <stdlib.h>
#include <stdio.h>
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
void _begin(short nCmdType, char cVersion, char cSubVersion)
{
	_reset();
	_writeHeader("IC", sizeof(char)*2, 0);// 命令码
	_writeHeader((char*)&nCmdType, sizeof(short), 2);// 命令码
	_writeHeader(&cVersion, sizeof(char), 4);		// 主版本号
	_writeHeader(&cSubVersion, sizeof(char), 5);	// 子版本号
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
	_begin(64, 15, 15);
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




