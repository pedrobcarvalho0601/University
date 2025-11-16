#include <stdio.h>
int main()
{


float x[10]={-0.7, 1.2, 0.1, 7.7, -3.9, 2.8, 17.0, -4.5, -0.6}, max;
int n;

n=0;
max=x[n];


while(n<=9)
	{
		if (max<x[n])
		{
		max=x[n];
		n=n+1;
		}
	}	

	
	
	
printf(" o valor maximo e = %f \n", x[n]);
	
	
	return(0);
}
