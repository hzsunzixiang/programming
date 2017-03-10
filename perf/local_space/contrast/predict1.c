#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>


  //65.64%  [kernel]  [k] clear_page                                                                                                                                                           T  16.15%  predict1  [.] main
  //11.79%  predict1  [.] searchInArray(int)
  // 2.56%  [kernel]  [k] __do_page_fault
  // 1.03%  [kernel]  [k] get_page_from_freelist
  // 0.51%  [kernel]  [k] handle_mm_fault
  // 0.51%  [kernel]  [k] page_add_new_anon_rmap
  // 0.26%  [kernel]  [k] __tlb_remove_page
  // 0.26%  [kernel]  [k] _raw_spin_lock
  // 0.26%  [kernel]  [k] _raw_spin_unlock_irqrestore
  // 0.26%  [kernel]  [k] alloc_pages_vma
  // 0.26%  [kernel]  [k] anon_vma_prepare
  // 0.26%  [kernel]  [k] error_exit
  // 0.26%  [kernel]  [k] free_hot_cold_page

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
	sleep(10);
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

	return 0;
}

//Time Expense is 24164
//sum is 124750
//Time Expense is 75437
//sum is 1247745185

