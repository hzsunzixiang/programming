#include <stdio.h>
int switch_eg_impl(int x, int n) {
	/* Table of code pointers */
	static void *jt[7] = {
		&&loc_A, &&loc_def, &&loc_B,
		&&loc_C, &&loc_D, &&loc_def,
		&&loc_D
	};
	unsigned index = n - 100;
	int result;

	if (index > 6)
		goto loc_def;

	/* Multiway branch */
	goto *jt[index];

loc_def: /* Default case*/
	result = 0;
	goto done;

loc_C: /* Case 103 */
	result = x;
	goto rest;

loc_A: /* Case 100 */
	result = x * 13;
	goto done;

loc_B: /* Case 102 */
	result = x + 10;
	/* Fall through */

rest: /* Finish case 103 */
	result += 11;
	goto done;

loc_D: /* Cases 104, 106 */
	result = x * x;
	/* Fall through */

done:
	return result;
}

int main()
{
	int x = switch_eg_impl(10, 100);
	printf("x=%d\n", x);
	return 0;
}
