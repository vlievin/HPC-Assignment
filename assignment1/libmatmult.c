#include <stdio.h>
#include <stdlib.h>
#include <cblas.h>
#include <string.h>		/* memset */

#define min(x,y) (((x) < (y)) ? (x) : (y))

void
matmult_lib (int m, int n, int k, double **A, double **B, double **C) //tested: OK
{

  double alpha = 1.0;
  double beta = 0.0;
  cblas_dgemm (CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k, alpha, *A,
	       k, *B, n, beta, *C, n);
}

/*
C = AB for an n x m matrix A and an m x p matrix B, then C is an n x p matrix

    Input: matrices A and B
    Let C be a new matrix of the appropriate size
    For i from 1 to n:
        For j from 1 to p:
            Let sum = 0
            For k from 1 to m:
                Set sum = sum + A_ik x B_kj
            Set C_ij = sum
    Return C
*/

void
matmult_nat (int m, int n, int k, double **A, double **B, double **C) //tested: OK
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
}

void
matmult_mnk (int m, int n, int k, double **A, double **B, double **C) //tested: OK
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
}

void
matmult_mkn (int m, int n, int k, double **A, double **B, double **C) //tested: OK
{

  int i, j, r;

// initialize all of C with zeroes without loop (C[m][n] = { 0 })
  memset (*C, 0, sizeof (double) * m * n);

  for (i = 0; i < m; i++)
    {
      for (r = 0; r < k; r++)
	{
	  for (j = 0; j < n; j++)
	    {
	      C[i][j] += A[i][r] * B[r][j];
	    }
	}
    }
}


void
matmult_knm (int m, int n, int k, double **A, double **B, double **C) //tested: OK
{

  int i, j, r;

// initialize all of C with zeroes without loop (C[m][n] = { 0 })
  memset (*C, 0, sizeof (double) * m * n);

  for (r = 0; r < k; r++)
    {
      for (j = 0; j < n; j++)
	{
	  for (i = 0; i < m; i++)
	    {
	      C[i][j] += A[i][r] * B[r][j];
	    }
	}
    }
}

void
matmult_kmn (int m, int n, int k, double **A, double **B, double **C) //tested: OK
{

  int i, j, r;

// initialize all of C with zeroes without loop (C[m][n] = { 0 })
  memset (*C, 0, sizeof (double) * m * n);

  for (r = 0; r < k; r++)
    {
      for (i = 0; i < m; i++)
	{
	  for (j = 0; j < n; j++)
	    {
	      C[i][j] += A[i][r] * B[r][j];
	    }
	}
    }
}

void
matmult_nmk (int m, int n, int k, double **A, double **B, double **C) //tested: OK
{

  int i, j, r;

// initialize all of C with zeroes without loop (C[m][n] = { 0 })
  memset (*C, 0, sizeof (double) * m * n);

  for (j = 0; j < n; j++)
    {
      for (i = 0; i < m; i++)
	{
	  for (r = 0; r < k; r++)
	    {
	      C[i][j] += A[i][r] * B[r][j];
	    }
	}
    }
}

void
matmult_nkm (int m, int n, int k, double **A, double **B, double **C) //tested: OK
{

  int i, j, r;

// initialize all of C with zeroes without loop (C[m][n] = { 0 })
  memset (*C, 0, sizeof (double) * m * n);

  for (j = 0; j < n; j++)
    {
      for (r = 0; r < k; r++)
	{
	  for (i = 0; i < m; i++)
	    {
	      C[i][j] += A[i][r] * B[r][j];
	    }
	}
    }
}

// http://www.netlib.org/utk/papers/autoblock/node2.html
// http://stackoverflow.com/questions/16115770/block-matrix-multiplication
void
matmult_blk (int m, int n, int k, double **A, double **B, double **C, int bs) //tested: OK
{

	int i_b, j_b, r_b, i, j, r;

	// initialize all of C with zeroes without loop (C[m][n] = { 0 })
	memset (*C, 0, sizeof (double) * m * n);

	for (i_b = 0; i_b < m; i_b += bs)
	{
		for (i = i_b; i < min (m, i_b + bs); i++)
		{
			for (j_b = 0; j_b < n; j_b += bs)
			{
		  		for (j = j_b; j < min (n, j_b + bs); j++)
		    		{

			  		for (r_b = 0; r_b < k; r_b += bs)
			    		{
			      			for (r = r_b; r < min (k, r_b + bs); r++)
						{
				  			C[i][j] += A[i][r] * B[r][j];
						}
			    		}
				}
		    	}
		}
	}
}
