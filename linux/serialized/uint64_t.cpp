#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>


static const uint32_t UINT64_HEX_BUF_LEN = 16 + 1;
char m_sllBuffer[UINT64_HEX_BUF_LEN];
void test(uint64_t n)
{
	memset(m_sllBuffer, 0, sizeof(m_sllBuffer));
#if defined (__LP64__) || defined (__64BIT__) || defined (_LP64) || (__WORDSIZE == 64)
	snprintf(m_sllBuffer, UINT64_HEX_BUF_LEN, "%016lx", n);
#else
	snprintf(m_sllBuffer, UINT64_HEX_BUF_LEN, "%016llx", n);
#endif

}


int main()
{
	uint64_t int64 = 9999;
	printf("%016lx\n", int64);

	//printf(m_sllBuffer, UINT64_HEX_BUF_LEN, "%016llx", n);
	return 0;
}

