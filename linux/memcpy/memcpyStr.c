	////////////////////////////////////////////////////////////////////////////////


#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <arpa/inet.h>

#define  PACKET_BUFFER_SIZE 100

#define  PACKET_HEADER_SIZE 50 

char m_strBuf[PACKET_BUFFER_SIZE];	// 报文包缓存
int m_nPacketSize = 0 ;	// 实际报文总长度
int m_nBufPos = 0;

// /////////////////////////////////////////////////////////////////////////////////
void _reset(void)
{
	memset(m_strBuf, 0, PACKET_BUFFER_SIZE);
}

int _Write(const char *pIn, int nLen)
{
	if((m_nPacketSize < 0) || ((nLen + m_nPacketSize) > PACKET_BUFFER_SIZE))
		return 1;
	memcpy(m_strBuf+m_nPacketSize, pIn, nLen);
	m_nPacketSize += nLen;
	return 0;
}

int WriteInt(int nValue)
{
	return _Write((char*)&nValue, sizeof(int));
}

// 写入一个变量
int _writezero(void)
{
	if((m_nPacketSize + 1) > PACKET_BUFFER_SIZE)
		return 1;
	memset(m_strBuf+m_nPacketSize, '\0', sizeof(char)) ;
	m_nPacketSize ++;
	return 0;
}
int WriteString(const char *pString)
{
	int nLen = (int)strlen(pString) ;
	WriteInt(nLen + 1) ;
	// 注意这里逻辑取反 c++用true 这里用 0 完全相反了
	return !_Write(pString, nLen) && _writezero();
}
int _copy(const void *pInBuf, int nLen)
{
	if(nLen > PACKET_BUFFER_SIZE)
		return 1;

	_reset();
	memcpy(m_strBuf, pInBuf, nLen);
	m_nPacketSize = nLen;
	return 0;
}
// 取出一个变量
int _Read(char *pOut, int nLen)
{
	if((nLen + m_nBufPos) > m_nPacketSize || (nLen + m_nBufPos) > PACKET_BUFFER_SIZE){
		return 1;
	}
	memcpy(pOut, m_strBuf + m_nBufPos, nLen);
	m_nBufPos += nLen;
	return 0;
}
int ReadInt(void)
{
	int nValue = -1;
	_Read((char*)&nValue, sizeof(int));
	return nValue;
} 
int ReadString(char *pOutString, int nMaxLen)
{
	int nLen = ReadInt();
	printf("the length: %d\n", nLen);
	if(nLen == -1)  //这里必需判断
		return 1;
	if(nLen > nMaxLen)
	{
		return 1;
	}
	int x = _Read(pOutString, nLen);
	return x;
}


int main()
{
	memset(m_strBuf, 0, PACKET_BUFFER_SIZE);

	WriteString("hello,world");


	//_begin(100, 31, 7);
	FILE* f = fopen("test.bin", "w+");
	fwrite(&m_strBuf, sizeof(m_strBuf), 1, f);

	char s[100];
	ReadString(s, 17);
	//s[12] = '\0';
	printf("%s\n", s);

	return 0;
}


