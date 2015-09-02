#include <stdio.h>
#include <stdlib.h>
#include <ucontext.h>

/* The three contexts:
 *    (1) main_context1 : The point in main to which loop will return.
 *    (2) main_context2 : The point in main to which control from loop will
 *                        flow by switching contexts.
 *    (3) loop_context  : The point in loop to which control from main will
 *                        flow by switching contexts. */
ucontext_t main_context1, main_context2, loop_context;

/* The iterator return value. */
volatile int i_from_iterator;

/* This is the iterator function. It is entered on the first call to
 * swapcontext, and loops from 0 to 9. Each value is saved in i_from_iterator,
 * and then swapcontext used to return to the main loop.  The main loop prints
 * the value and calls swapcontext to swap back into the function. When the end
 * of the loop is reached, the function exits, and execution switches to the
 * context pointed to by main_context1. */

//    makecontext(&loop_context, (void (*)(void)) loop, 3, &loop_context, &main_context2, &i_from_iterator);
   
void loop(
    ucontext_t *loop_context,
    ucontext_t *other_context,  // this main_context2
    int *i_from_iterator)
{
    int i;
    
    for (i=0; i < 10; ++i) {
        /* Write the loop counter into the iterator return location. */
        *i_from_iterator = i;
        
        /* Save the loop context (this point in the code) into ''loop_context'',
         * and switch to other_context. */
        swapcontext(loop_context, other_context); // here main_context2 is other_context
    }
	// for 循环结束时不再执行swapcontext 
	// 退出循环之后执行uc_link中指定的main_context1
	printf("the loop finish   \n");
    
    /* The function falls through to the calling context with an implicit
     * ''setcontext(&loop_context->uc_link);'' 在这里是main_context1 */
} 
 
int main(void)
{
    /* The stack for the iterator function. */
	// 这个栈空间是 mian_context1 中执行loop函数
    char iterator_stack[SIGSTKSZ];

    /* Flag indicating that the iterator has completed. */
    volatile int iterator_finished;
   

    getcontext(&loop_context);
    /* Initialise the iterator context. uc_link points to main_context1, the
     * point to return to when the iterator finishes. */
	// loop_context 结束的时候调用 main_context1 ，真正的赋值在下面的getcontex中，这里只是把地址传给uc_link
    loop_context.uc_link          = &main_context1;
    loop_context.uc_stack.ss_sp   = iterator_stack;
    loop_context.uc_stack.ss_size = sizeof(iterator_stack);

	// Before invoking makecontext(), the caller  "must  allocate  a  new  stack  for  this  context "
	// and  assign  its  address  to ucp->uc_stack, and define a successor context and assign its address to ucp->uc_link.
	
    /* Fill in loop_context so that it makes swapcontext start loop. The
     * (void (*)(void)) typecast is to avoid a compiler warning but it is
     * not relevant to the behaviour of the function. */

     // 在loop_context 和main_context2 之间来回循环，执行完loop直接跳转到 main_context1  <--- uc_link = &main_context1
    makecontext(&loop_context, (void (*)(void)) loop,
        3, &loop_context, &main_context2, &i_from_iterator);
   
    /* Clear the finished flag. */      
    iterator_finished = 0;

    /* Save the current context into main_context1. When loop is finished,
     * control flow will return to this point. */
    getcontext(&main_context1);
	printf("the iterator_finished: %d.....\n", iterator_finished);
  
    if (!iterator_finished) {
        /* Set iterator_finished so that when the previous getcontext is
         * returned to via uc_link, the above if condition is false and the
         * iterator is not restarted. */
        iterator_finished = 1;
       
        while (1) {
            /* Save this point into main_context2 and switch into the iterator.
             * The first call will begin loop.  Subsequent calls will switch to
             * the swapcontext in loop. */
        // When  this  context  is  later activated (using setcontext(2) or swapcontext()) the function func is called, and passed the series of integer (int) arguments that follow argc; the caller must specify the number of these arguments  in  argc.   When  this function returns, the successor context is activated.  If the successor context pointer is NULL, the thread exits.
       //The  swapcontext()  function  saves the current context < here is main_context2 > in the structure pointed to by oucp, and then activates the context pointed to by ucp.

            swapcontext(&main_context2, &loop_context);
            printf("%d\n", i_from_iterator);
	        // 执行完打印操作之后，继续循环，然后再次执行swapcontext  执行 loop_context
        }
    }
	printf("main return.....\n");
    
    return 0;
}
