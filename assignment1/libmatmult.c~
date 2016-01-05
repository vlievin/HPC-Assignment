#include <stdio.h>
#include <stdlib.h>
#include <cblas.h>

void
matmult_lib (int m, int n, int k, double **A, double **B, double **C)
{

  double alpha = 1.0;
  double beta = 0.0;
  cblas_dgemm (CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k, alpha, *A,
	       k, *B, n, beta, *C, n);
}

// natural C ordering
double **
matmult_nat (int m, int n, int k, double **A, double **B, double **C)
{

  int i, j, r, sum;

  for (i = 0; i < m; i++)
    {
      for (j = 0; j < n; j++)
	{
	  sum = 0;
	  for (r = 0; r < k; r++)
	    {
	      sum = sum + A[i][r] * B[r][j];
	    }
	  C[i][j] = sum;
	}
    }

  return C;
}

double **
matmult_blk (int m, int n, int k, double *A, double *B, double *C, int bs)
{

}

double **
matmult_mnk (int m, int n, int k, double *A, double *B, double *C)
{

}

double **
matmult_mkn (int m, int n, int k, double *A, double *B, double *C)
{

}

double **
matmult_knm (int m, int n, int k, double *A, double *B, double *C)
{

}

double **
matmult_kmn (int m, int n, int k, double *A, double *B, double *C)
{

}

double **
matmult_nmk (int m, int n, int k, double *A, double *B, double *C)
{

}

double **
matmult_nkm (int m, int n, int k, double *A, double *B, double *C)
{

}
