#include <iostream>
#include <sstream>
#include <mpi.h>
#include <stdlib.h>
#include "Print.h"
#include "Dot.h"

int main(int argc, char** argv)
{
    // Get MPI information
    int myrank, nprocs;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);

    // Make strings of the MPI information
    std::ostringstream strrank, strnprocs;
    strrank << myrank;
    strnprocs << nprocs;

    // Print a message specifying MPI information
    std::string message = "Hello from process " + strrank.str() + " of " + strnprocs.str() + "\n";
    Print::Print(message);

    // Get the size of the vector
    int n = 100;
    if (argc > 1)
      n = atoi(argv[1]);
    std::cout << n << "\n";
    int localn = n*(myrank+1)/nprocs - n*myrank/nprocs;

    double *vector1 = new double[n];
    double *vector2 = new double[n];

    // Assign random values to the vectors
    for (int i = 0; i < localn; i++)
    {
      vector1[i] = rand()/((double)RAND_MAX);
      vector2[i] = rand()/((double)RAND_MAX);
    }

    // Take the dot product
    double tStart = MPI_Wtime();
    double dot = Dot::Dot(vector1, vector2, localn);
    MPI_Allreduce(MPI_IN_PLACE, &dot, 1, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
    double tEnd = MPI_Wtime();

    // Print the result
    std::ostringstream strdot, strtime;
    strdot << dot;
    strtime << (tEnd - tStart);
    message = "The inner product of the two vectors is: " + strdot.str() + "\n" + 
              "and it took " + strtime.str() + " seconds to calculated it\n";
    if (myrank == 0)
        Print::Print(message);

    MPI_Finalize();
    return 0;
}
