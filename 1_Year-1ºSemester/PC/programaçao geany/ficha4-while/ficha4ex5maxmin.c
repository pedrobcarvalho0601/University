#include <stdio.h>
int main()
{


float x[10]={-0.7, 1.2, 0.1, 7.7, -3.9, 2.8, 17.0, -4.5, -0.6}, max,min;
int n;

n=0;
max=x[n];
min=x[n];

	while(n<=9)
	{
		if (max<x[n])		max=x[n];
		n++;
		
	}
	printf("\n o valor maximo e = %.1f \n", max);
	
n=0;
	
	while(n<=9)
	{
		if (min>x[n])		min=x[n];
		n++;
		
	}
	printf("\n o valor minimo e = %.1f \n", min);
	
	
	
	
	
	return(0);
}
