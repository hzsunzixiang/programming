#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>

//Samples: 637  of event 'cpu-clock', Event count (approx.): 7383483
//  35.64%  predict           [.] searchInArray(int)                                                                                                                                           T  31.87%  [kernel]47        [k] clear_page
//  12.09%  predict   sum is 1[.] main
//   9.11%  libc-2.19.so      [.] __random_rnse is 98392
//   6.91%  libc-2.19.so      [.] __random              sum is 1247745185
//   1.57%  libc-2.19.so      [.] rand
//   1.41%  predict           [.] rand@plt
//   0.31%  [kernel]          [k] __do_page_fault
//   0.16%  [kernel]          [k] __tlb_remove_page
//   0.16%  [kernel]          [k] _raw_spin_unlock_irqrestore
//   0.16%  [kernel]          [k] free_hot_cold_page
//   0.16%  [kernel]          [k] get_page_from_freelist
//   0.16%  [kernel]          [k] page_remove_rmap
//   0.16%  [kernel]          [k] unmap_single_vma
//   0.16%  libgcc_s.so.1     [.] 0x0000000000002fa0
#define arraySize 10000000
int array[arraySize] = {0};

int searchInArray(int value)
{
	int sum = 0;
	for(int i=0; i<arraySize;i++)
	{
		if(value > array[i])
		{
			sum+=array[i];
		}
	}
	return sum;
}
int main()
{
	clock_t start;
	clock_t end;
	int sum = 0;
	//有序数组查找
	for(int i=0; i<arraySize; i++)
	{
		array[i] = i;
	}
	start = clock();
	sum += searchInArray(500);
	end = clock();
	printf("Time Expense is %ld\n",end-start);
	printf("sum is %d\n",sum);

	//无序数组查找
	for(int i=0; i<arraySize; i++)
	{
		array[i] = rand()%1000;
	}
	start = clock();
	sum += searchInArray(500);
	end = clock();
	printf("Time Expense is %ld\n",end-start);
	printf("sum is %d\n",sum);
	return 0;
}

//Time Expense is 24164
//sum is 124750
//Time Expense is 75437
//sum is 1247745185

