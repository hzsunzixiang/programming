#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <stdio.h>


// 无序数组
 // 30.54%  predict2      [.] searchInArray(int)                                                                                                                                               T  19.46%  predict270    [.] main
 // 16.52%  [kernel]  sum [k] clear_page
 // 12.67%  libc-2.19.so  [.] __random
 // 11.31%  libc-2.19.so  [.] __random_r
 //  4.30%  libc-2.19.so  [.] rand
 //  1.36%  predict2      [.] rand@plt
 //  0.90%  [kernel]      [k] get_page_from_freelist
 //  0.45%  [kernel]      [k] __do_page_fault
 //  0.45%  [kernel]      [k] handle_mm_fault
 //  0.45%  [kernel]      [k] unmap_single_vma
 //  0.23%  [kernel]      [k] __alloc_pages_nodemask
 //  0.23%  [kernel]      [k] _raw_spin_unlock_irqrestore
 //  0.23%  [kernel]      [k] add_mm_counter_fast
 //  0.23%  [kernel]      [k] free_pages_and_swap_cache
 //  0.23%  [kernel]      [k] free_pages_prepare
 //  0.23%  [kernel]      [k] next_zones_zonelist
 //  0.23%  [kernel]      [k] page_remove_rmap

// 有序数组
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

