#include <stdio.h>

	int fun_par_impar (int x)
	{
		if (x%2==0)
		return(1);
		
		else 
		return(-1);
	}
	 
	int main()
	{
		int xn;
		
		printf("escreva um numero entre 5 a 100 \n");
		scanf(" %d", &xn);
		
		if ( xn<5 || xn>100 )
		{
		while( xn<5 || xn>100 )
		{
		printf("escreva outra vez um numero entre 5 a 100 \n");
		scanf(" %d", &xn);
		}
		}
		
		int R;
		
		R=fun_par_impar(xn);
		
		if (R==1)
		printf("e par");
		else
		printf("e impar");

return(0);
}

