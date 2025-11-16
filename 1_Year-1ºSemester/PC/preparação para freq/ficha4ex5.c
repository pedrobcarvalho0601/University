#include <stdio.h>

int main()
{
	float array[]={5.3,2,13,-1.5,3};
	
	float valor;
	
	valor=array[0];
	for (int i=0;i<6;i++)
	{
		if(valor<array[i+1])
		{
			valor=array[i+1];
		}
		else 
		{
			
		}
	}
	printf(" %f",valor);
	
	return 0;
	
}
