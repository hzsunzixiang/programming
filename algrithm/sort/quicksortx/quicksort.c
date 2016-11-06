#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
// https://gist.github.com/mpenkov/5301559
/*
 * Swap the ith and jth elements of the array A in-place.
 */
	void
swap(int *A, size_t i, size_t j)
{
	int tmp = A[j];
	A[j] = A[i];
	A[i] = tmp;
}

/*
 * Divide the sub-array A[start:end] into two partitions by pivoting around
 * A[pvt].  All elements less than or equal to A[pvt] will be in the left
 * partition.  All other elements will be in the right partition.
 * Returns the partition boundary (which is the new location of the pivot).
 */
	size_t
partition(int *A, size_t start, size_t end, size_t pvt)
{
	/*
	 * http://en.wikipedia.org/wiki/Quicksort#In-place_version
	 *
	 * Grow the left partition such that it contains elements <= A[pvt].
	 * The pivot gets in the way, so move it to the end of the subarray before
	 * partitioning, and move it back afterwards.
	 */
	size_t j;
	size_t tail = start;
	assert(pvt >= start);
	assert(pvt < end);
	swap(A, pvt, end-1);
	for (j = start; j < end; ++j)
		if (A[j] < A[end-1])
			swap(A, j, tail++);
	swap(A, end-1, tail);
	return tail;
}

/*
 * Determines the method used to select the pivot element.
 */
enum Mode
{
	PIVOT_FIRST = 0,
	PIVOT_LAST = 1,
	PIVOT_MIDDLE = 2
};

/*
 * Sort the subarray A[start:end] using recursive in-place Quicksort.
 * To sort the entire array A, specify start and end as 0 and the length of the
 * array, respectively.
 * The mode parameter determines the method of selecting the pivot element.
 */
	void
quicksort(int *A, size_t start, size_t end, enum Mode mode)
{
	size_t pvt;
	switch (mode)
	{
		case PIVOT_FIRST:
			pvt = start;
			break;
		case PIVOT_LAST:
			pvt = end-1;
			break;
		case PIVOT_MIDDLE:
			pvt = (end+start)/2;
			break;
		default:
			assert(0);
	}
	if (end-start < 2)
		return;
	pvt = partition(A, start, end, pvt);
	quicksort(A, start, pvt, mode);
	quicksort(A, pvt+1, end, mode);
}

	void
print_array(int *A, size_t arraylen)
{
	size_t j;
	for (j = 0; j < arraylen; ++j)
		printf("%d ", A[j]);
	printf("\n");
}

	int
main(int argc, char **argv)
{
	size_t arraylen = argc-2;
	int *A = NULL;
	size_t j;
	enum Mode mode;
	if (argc < 3)
	{
		printf("usage: %s [012] 5 4 3 2 1\n", argv[0]);
		return -1;
	}
	mode = atoi(argv[1]);
	switch (mode)
	{
		case PIVOT_FIRST:
		case PIVOT_LAST:
		case PIVOT_MIDDLE:
			break;
		default:
			printf("invalid mode: %d\n", mode);
			return 0;
	}
	A = malloc(sizeof(int)*arraylen);
	assert(A);
	for (j = 0; j < arraylen; ++j)
		A[j] = atoi(argv[j+2]);
	//print_array(A, arraylen);
	quicksort(A, 0, arraylen, mode);
	print_array(A, arraylen);
	return 0;
}
