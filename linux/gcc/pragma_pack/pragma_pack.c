#include <stdio.h>
#include <stddef.h>

int main(void)
{

//#pragma pack(push, 1) // save current pack setting and set to 1
#pragma pack(push, 2) // save current pack setting and set to 2

	struct foo {
		int x;
		char c;
	};
	struct foo arr[2] = { { 'a', 10 }, {'b', 20 } };
	int *p0 = &arr[0].x;
	int *p1 = &arr[1].x;
	printf("sizeof(struct foo)      = %d\n", (int)sizeof(struct foo));
	printf("offsetof(struct foo, x) = %d\n", (int)offsetof(struct foo, x));
	printf("offsetof(struct foo, c) = %d\n", (int)offsetof(struct foo, c));
	printf("arr[0].x = %d\n", arr[0].x);
	printf("arr[1].x = %d\n", arr[1].x);
	printf("p0 = %p\n", (void*)p0);
	printf("p1 = %p\n", (void*)p1);
	printf("*p0 = %d\n", *p0);
	printf("*p1 = %d\n", *p1);

#pragma pack(pop)     // return to previous pack setting


#pragma pack(1) // save current pack setting and set to 1
	struct my_unpacked_struct  
	{
		char c;
		int i;
	};
	
	struct my_packed_struct
	{
		char c;
		int  i;
		struct my_unpacked_struct s;
	};
	printf("sizeof(struct my_packed_struct)      = %d\n", (int)sizeof(struct my_packed_struct));
	printf("offsetof(struct my_packed_struct, c) = %d\n", (int)offsetof(struct my_packed_struct, c));
	printf("offsetof(struct my_packed_struct, i) = %d\n", (int)offsetof(struct my_packed_struct, i));
	printf("offsetof(struct my_packed_struct, s) = %d\n", (int)offsetof(struct my_packed_struct, s));

    return 0;
}




//    #pragma pack(n) simply sets the new alignment.
//    #pragma pack() sets the alignment to the one that was in effect when compilation started (see also command-line option -fpack-struct[=n] see Code Gen Options).
//    #pragma pack(push[,n]) pushes the current alignment setting on an internal stack and then optionally sets the new alignment.
//    #pragma pack(pop) restores the alignment setting to the one saved at the top of the internal stack (and removes that stack entry). Note that #pragma pack([n]) does not influence this internal stack; thus it is possible to have #pragma pack(push) followed by multiple #pragma pack(n) instances and finalized by a single #pragma pack(pop). 
