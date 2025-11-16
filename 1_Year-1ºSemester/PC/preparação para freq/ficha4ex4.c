#include <stdio.h>

float fun_mean(int num1,int num2,int num3)
{
	float media;
	media=(num1+num2+num3)/3;
	return(media);
}

int fun_max(int num1,int num2,int num3)
{
	int maior;
	
	maior=num1;
	if(num2>maior)
	{
	maior=num2;
	}	
	if(num3>maior)
	{
	maior=num3;
	}
	return(maior);	
}
	int main()
	{
		
		int a, b, c;
		printf("escreva 3 numeros \n");
		scanf(" %d %d %d", &a, &b, &c);
		int maior;
		float media;
		
		media=fun_mean(a,b,c);
		
		maior=fun_max(a,b,c);
		
		printf("media e %f \n", media);		
		printf("maior e %d", maior);	
			
		return (0);
	}
