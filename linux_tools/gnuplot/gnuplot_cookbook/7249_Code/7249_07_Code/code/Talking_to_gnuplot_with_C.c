#include <stdio.h>
void main()
{
  FILE* gnuplot;
  gnuplot = popen("gnuplot -persist", "w");
  if (gnuplot != NULL)
    fprintf(gnuplot, "plot sin(1/x)\n");
}
