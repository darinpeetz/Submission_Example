namespace Dot
{
  double Dot(double *vector1, double *vector2, int localn)
  {
    double dot = 0;
    for (int i = 0; i < localn; i++)
      dot += vector1[i]*vector2[i];

    return dot;
  }
}
