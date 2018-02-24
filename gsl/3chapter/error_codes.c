#include <stdio.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_fft_complex.h>

int main()
{


// 有待于进一步验证
	//int status;

	//int status = sqrt(-1);
	// 复数的平方根 gsl_complex gsl_complex_sqrt(gsl_complex z)


// gsl_error_handler_t * gsl_set_error_handler_off()
// This function turns off the error handler by defining an error handler which does nothing. This will cause the
// program to continue after any error, so the return values from any library routines must be checked. This is the
// recommended behavior for production programs. The previous handler is returned (so that you can restore it
// later).




	size_t n = 37;
	gsl_set_error_handler_off();
	// int a = sqrt(-1);
	//status = gsl_fft_complex_radix2_forward (data, stride, n);
	// if (status) {
	// 	if (status == GSL_EINVAL) {
	// 		fprintf (stderr, "invalid argument, n=%d\n", n);
	// 	} else {
	// 		fprintf (stderr, "failed, gsl_errno=%d\n", status);
	// 	}
	// 	exit (-1);
	// }
	return 0;
}
