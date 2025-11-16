
#include <stdio.h>
int main()
{
	int x,n;
	
	printf("iremos calcular um valor de X^n \n");
	printf("escolha um valor para X \n");
	
	scanf(" %d", &x);
	
	printf("agora escolha um valor para o n que seja menor ou igual a 6 e maior ou igual a 0 \n");
	
	scanf(" %d", &n);
	
	switch(n){
		case 0:  printf(" o valor de %d elevado a %d e: %d",x,n,1 ); break;
		
		case 1:  printf(" o valor de %d elevado a %d e: %d",x,n, x); break;
		
		case 2: printf("o valor de %d elevado a %d e: %d",x,n, x*x ); break;
		
		case 3: printf("o valor de %d elevado a %d e: %d",x,n, x*x*x ); break;
		
		case 4: printf(" o valor de %d elevado a %d e: %d",x,n, x*x*x*x); break;
		
		case 5: printf(" o valor de %d elevado a %d e: %d",x,n, x*x*x*x*x); break;
			
		case 6: printf(" o valor de %d elevado a %d e: %d",x,n, x*x*x*x*x*x); break;
		
		default: printf(" Nao escolheu um expoente valido \n");break;
		}
	return 0;
	}
	
