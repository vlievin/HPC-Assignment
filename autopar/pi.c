#include <stdio.h>
#include <stdlib.h>

double serial_pi(long N) {

  double pi = 0.0;
  double par = 0.0;
  int i;

  for(i = 1; i <= N; i++) {
    par = ( (double)i - 0.5) / (double)N;
    pi += 4.0 / ( 1.0 +  par * par );
  }

  pi *= ( 1.0 / (double)N );

  return pi;
}

int main(int argc, char *argv[]) {

  long N = 100;

  // Looks if N is defined as argument.
  if(argc > 1) {
    printf("The argument supplied for N is: %s\n", argv[1]);
    N = atoi(argv[1]);
  }

  // Inform user about size of N.
  double pi = serial_pi(N);

  printf("Pi is %f\n", pi);
  return 0;
}
