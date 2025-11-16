#include <stdio.h>

int main()
{	
	float array_1[8] = {1, 3, 5, 7, -6, -4, -2, -1};
	int tamanho1 = sizeof(array_1) / sizeof(array_1[0]);
	
	//float array_2[6] = {0.3, -1.4, 2.2, 5.9, -2.0, 5.3};
	
	

	float *pt_1 = array_1;
	//float *pt_2 = array_2;
	
	float soma=0;
	
	while(pt_1<tamanho1+array_1)
	{
		soma = soma + *pt_1;
		pt_1++;
	}
	
	float result;
	result=soma/tamanho1;
	
	printf("media do primeiro array e: %f \n", result);
	
	return (0);
}
