#include <stdio.h>

int fun_par_impar (int x)
	{	
		
		if (x%2==0)
		{
		x=1;
		}
			else
			{ 
			x=-1;
			}
		return(x);
	}
	
	int main()
{
		int y;
		
		printf(" escreve um numero \n");
		scanf(" %d", &y);
			
		int k =fun_par_impar(y);
		
		if(k==1)
		{
		printf("o numero e par \n");
		}
			else
			{
			printf("o numero e impar \n");
			}
			
	return(0);
}		
		
