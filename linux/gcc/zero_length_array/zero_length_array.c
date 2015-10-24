#include <stdio.h>
#include <stdlib.h>



struct line {
	int length;
	char contents[0];
};


int main()
{

	struct line l;
	printf("sizefo(struct line):%d\n", sizeof(l));

	int this_length = 1024;
	struct line *thisline = (struct line *) malloc (sizeof (struct line) + this_length);
	thisline->length = this_length;
	free(thisline);

	return 0;
}

// https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
// http://stackoverflow.com/questions/295027/array-of-zero-length
// Your intution about "why not use an array of size 1" is spot on.
// 
// The code is doing the "C struct hack" wrong, because declarations of zero length arrays are a constraint violation. This means that a compiler can reject your hack right off the bat at compile time with a diagnostic message that stops the translation.
// 
// If we want to perpetrate a hack, we must sneak it past the compiler.
// 
// The right way to do the "C struct hack" (which is compatible with C dialects going back to 1989 ANSI C, and probably much earlier) is to use a perfectly valid array of size 1:
// 
// struct someData
// {
//    int nData;
//    unsigned char byData[1];
// }
// Moreover, instead of sizeof struct someData, the size of the part before byData is calculated using:
// 
// offsetof(struct someData, byData);
// To allocate a struct someData with space for 42 bytes in byData, we would then use:
// 
// struct someData *psd = (struct someData *) malloc(offsetof(struct someData, byData) + 42);
// Note that this offsetof calculation is in fact the correct calculation even in the case of the array size being zero. You see, sizeof the whole structure can include padding. For instance, if we have something like this:
// 
// struct hack {
//   unsigned long ul;
//   char c;
//   char foo[0]; /* assuming our compiler accepts this nonsense */
// };
// The size of struct hack is quite possibly padded for alignment because of the ul member. If unsigned long is four bytes wide, then quite possibly sizeof (struct hack) is 8, whereas offsetof(struct hack, foo) is almost certainly 5. The offsetof method is the way to get the accurate size of the preceding part of the struct just before the array.
// 
// So that would be the way to refactor the code: make it conform to the classic, highly portable struct hack.
// 
// Why not use a pointer? Because a pointer occupies extra space and has to be initialized.
// 
// There are other good reasons not to use a pointer, namely that a pointer requires an address space in order to be meaningful. The struct hack is externalizeable: that is to say, there are situations in which such a layout conforms to external storage such as areas of files, packets or shared memory, in which you do not want pointers because they are not meaningful.
// 
// Several years ago, I used the struct hack in a shared memory message passing interface between kernel and user space. I didn't want pointers there, because they would have been meaningful only to the original address space of the process generating a message. The kernel part of the software had a view to the memory using its own mapping at a different address, and so everything was based on offset calculations.
