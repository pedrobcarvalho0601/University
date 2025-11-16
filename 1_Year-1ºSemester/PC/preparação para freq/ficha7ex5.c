#include <stdio.h>

long int fun_power(int x, int n)
{
	int resultado=1;
	int i=1;
	
	while(i<=n)
	{
		resultado=resultado*x;
		i++;
	}
	return(resultado);
}	

int main()
{
	int x,n;
	
	printf("escreva um valor para base e para expoente \n");
	scanf(" %d %d", &x, &n);
	
	int R;
	
	R=fun_power(x,n);
	
	printf("%d",R);
	
	return(0);
}
