#include <stdio.h>

#include "gsl/gsl_math.h"
int main (void)
{
	// M_E	The base of exponentials, e
	// M_LOG2E	The base-2 logarithm of e, \log_2 (e)
	// M_LOG10E	The base-10 logarithm of e, \log_{10} (e)
	// M_SQRT2	The square root of two, \sqrt 2
	// M_SQRT1_2	The square root of one-half, \sqrt{1/2}
	// M_SQRT3	The square root of three, \sqrt 3
	// M_PI	The constant pi, \pi
	// M_PI_2	Pi divided by two, \pi/2
	// M_PI_4	Pi divided by four, \pi/4
	// M_SQRTPI	The square root of pi, \sqrt\pi
	// M_2_SQRTPI	Two divided by the square root of pi, 2/\sqrt\pi
	// M_1_PI	The reciprocal of pi, 1/\pi
	// M_2_PI	Twice the reciprocal of pi, 2/\pi
	// M_LN10	The natural logarithm of ten, \ln(10)
	// M_LN2	The natural logarithm of two, \ln(2)
	// M_LNPI	The natural logarithm of pi, \ln(\pi)
	// M_EULER	Euler’s constant, \gamma

	printf ("M_E :%lf, M_LOG2E	:%lf, M_LOG10E :%lf, M_SQRT2 :%lf, M_SQRT1_2 :%lf, M_SQRT3	:%lf, M_PI :%lf, M_PI_2 :%lf, M_PI_4 :%lf, M_SQRTPI :%lf, M_2_SQRTPI :%lf, M_1_PI :%lf, M_2_PI :%lf, M_LN10 :%lf, M_LN2 :%lf, M_LNPI :%lf, M_EULER:%lf\n", M_E, M_LOG2E	,M_LOG10E ,M_SQRT2 ,M_SQRT1_2 ,M_SQRT3	,M_PI ,M_PI_2 ,M_PI_4 ,M_SQRTPI ,M_2_SQRTPI ,M_1_PI ,M_2_PI ,M_LN10 ,M_LN2 ,M_LNPI ,M_EULER);



    printf("GSL_POSINF:%lf\n", GSL_POSINF);
    printf("GSL_NEGINF:%lf\n", GSL_NEGINF);
    printf("GSL_NAN:%lf\n", GSL_NAN);


// int gsl_isnan(const double x)
// This function returns 1 if x is not-a-number.

    printf("GSL_NAN:%d\n", gsl_isnan(GSL_NAN));
    printf("GSL_POSINF:%d\n", gsl_isnan(GSL_POSINF));
    printf("GSL_NEGINF:%d\n", gsl_isnan(GSL_NEGINF));
    printf("1:%d\n", gsl_isnan(1));

// int gsl_isinf(const double x)
// This function returns +1 if x is positive infinity, -1 if x is negative infinity and 0 otherwise. 
    printf("GSL_POSINF:%d\n", gsl_isinf(GSL_POSINF));
    printf("GSL_NEGINF:%d\n", gsl_isinf(GSL_NEGINF));
    printf("GSL_NAN:%d\n", gsl_isinf(GSL_NAN));

// int gsl_finite(const double x)
// This function returns 1 if x is a real number, and 0 if it is infinite or not-a-number.
    printf("GSL_POSINF:%d\n", gsl_finite(GSL_POSINF));
    printf("GSL_NEGINF:%d\n", gsl_finite(GSL_NEGINF));
    printf("GSL_NAN:%d\n", gsl_finite(GSL_NAN));
    printf("1:%d\n", gsl_finite(1));

// double gsl_log1p(const double x)
// This function computes the value of \log(1+x) in a way that is accurate for small x. It provides an alternative to the BSD math function log1p(x).
    printf("gsl_log1p(100):%lf\n", gsl_log1p(100));
// GSL_IS_ODD(n)
// This macro evaluates to 1 if n is odd and 0 if n is even. The argument n must be of integer type.
    printf("GSL_IS_ODD(100):%d\n", GSL_IS_ODD(100));
    printf("GSL_IS_EVEN(100):%d\n", GSL_IS_EVEN(100));



	return 0;

}
