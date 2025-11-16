#include <stdio.h> // preencher valores num array
int main()
{
	int x,n;
	int cont;
	float exp;
	
	printf("escolha o numero para a base \n");
	scanf("%d", &x);
	
	printf("escolha o numero para o expoente maior que -3 e menor que 0 \n");
	scanf("%d", &n);
	
	if(n>0 || n<-3) return(0);
	
	cont=0;
	exp=1;

	do{
		exp=exp*(1.0/x);
		cont--;
		
	} while(cont != n);
	printf("\n O valor de %d elevado a %d: %f\n", x, n, exp);
	
 return (0);
}		
		
	





