#include <iostream>
#include <sstream>
#include <mpi.h>
#include "Print.h"

int main(int argc, char** argv)
{
    int myrank, nprocs;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);

    std::ostringstream strrank, strnprocs;
    strrank << myrank;
    strnprocs << nprocs;

    std::string message = "Hello from process " + strrank.str() + " of " + strnprocs.str() + "\n";

    Print::Print(message);

    MPI_Finalize();
    return 0;
}
