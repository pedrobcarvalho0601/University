#include <stdio.h>

int Mandelbrot (int z0, int n);

int main ()
{
	int z0, n, z;

	printf ("Introduza o valor inicial (z0): ");
	scanf ("%d", &z0);
	printf ("Indique o número de iterações (n): ");
	scanf ("%d", &n);
	z = Mandelbrot (z0, n);
	printf ("O resultado é: %d\n",z);
	return 0;
}