

#include <vector>  
#include <stdio.h>  
using namespace std;  
struct POKERCARD
{
	union
	{
		unsigned short card;
		struct {unsigned char value, color;} split;
	}S_un;
};

static const char * const g_color[] =
{
	"方块",  // 方
	"梅花", // 梅
	"红桃", // 红
	"黑桃" // 黑
};

static const char * const g_val[] =
{
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"10",
	"J",
	"Q",
	"K",
	"A"
};
enum
{   // 方块         梅花     红桃       黑桃
	    FANG_KUAI = 1, MEI_HUA, HONG_TAO, HEI_TAO
};


int main()  
{  
	POKERCARD card1;
	card1.S_un.split.value = 0x0d;
	card1.S_un.split.color= HEI_TAO; 
	printf("0x%x\n", card1.S_un.card);

	return 0;  
}  
