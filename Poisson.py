#!/usr/local/bin/python

# Solve the Poisson Equation on an nxn mesh
# using 5-point finite difference stencil

import numpy as np
import scipy.sparse as sparse
import scipy.sparse.linalg as spla
import sys

if __name__ == '__main__':
    n = 101
    # Check if we specified a different size from input
    if len(sys.argv) > 1:
        n = int(sys.argv[1])

    # Construct operator
    I = np.zeros(5*n*n)
    J = np.zeros(5*n*n)
    K = np.zeros(5*n*n)
    ind = 0
    for i in range(n):
        for j in range(n):
            I[ind] = i*n+j
            J[ind] = i*n+j
            K[ind] = 4
            ind += 1
            if i > 0:
                I[ind] = i*n+j
                J[ind] = (i-1)*n+j
                K[ind] = -1
                ind += 1
            if j > 0:
                I[ind] = i*n+j
                J[ind] = i*n+j-1
                K[ind] = -1
                ind += 1
            if i < n-1:
                I[ind] = i*n+j
                J[ind] = (i+1)*n+j
                K[ind] = -1
                ind += 1
            if j < n-1:
                I[ind] = i*n+j
                J[ind] = i*n+j+1
                K[ind] = -1
                ind += 1

    A = sparse.csr_matrix((K[:ind], (I[:ind], J[:ind])), shape=(n*n,n*n))

    # Construct right-hand side
    b = np.zeros(A.shape[0])
    b[n*(n-1)//2 + (n+1)//2] = 1

    # Solve linear system
    x = spla.spsolve(A, b)

    print('The norm of the result on an %ix%i grid is %1.6g\n' % (n, n, np.linalg.norm(x)))
