#include <stdio.h>
int main()
{
	int x,n,cont,exp;
	
	printf("iremos calcular um valor de X^n \n");
	printf("escolha um valor para X \n");
	
	scanf(" %d", &x);
	
	printf("agora escolha um valor para o n que seja menor ou igual a 6 e maior ou igual a 0 \n");
	
	scanf(" %d", &n);
	
	if
			exp = 1;
			cont = 0;
  
			while (cont != n) 
			{
			exp = exp * x;
			cont = cont + 1;
			}
	  printf("\n O valor de %d elevado a %d: %d\n", x, n, exp);
  
  return 0;
}
