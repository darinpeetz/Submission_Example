#include <iostream>
#include <sstream>
#include <stdlib.h>
#include "Print.h"
#include "Dot.h"

int main(int argc, char** argv)
{


    // Print a message specifying MPI information
    std::string message = "Hello from process 0 of 1\n";
    Print::Print(message);

    // Get the size of the vector
    int n = 100;
    if (argc > 1)
      n = atoi(argv[1]);
    int localn = n;

    double *vector1 = new double[100];
    double *vector2 = new double[100];

    // Assign random values to the vectors
    for (int i = 0; i < localn; i++)
    {
      vector1[i] = rand()/((double)RAND_MAX);
      vector2[i] = rand()/((double)RAND_MAX);
    }

    // Take the dot product
    double dot = Dot::Dot(vector1, vector2, localn);

    // Print the result
    std::ostringstream strdot;
    strdot << dot;
    message = "The inner product of the two vectors is: " + strdot.str() + "\n";
    Print::Print(message);

    return 0;
}
