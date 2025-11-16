#include <stdio.h>

float fun_temp(float t, char un)
{
	float saida;
	
	if ('c'==un || 'C'==un)
		saida =(32+9.0*t/5.0);
	else saida = 5.0/9.0*(t-32);
	
	return saida; 
}

int main()
{
	float valtemp;
	char unid;
	
	
	printf("digite uma temperatura \n");
	scanf(" %f", &valtemp);
	
	printf("escolha a unidade C ou outra letra \n");
	scanf(" %c", &unid );
	
    float res;
    
    res = fun_temp(valtemp, unid);
    if ('c'==unid || 'C'==unid)
		printf(" %fC vale %fF", valtemp, res);
	else
		printf(" %fF vale %fC", valtemp, res);
			
//=====================

    res = fun_temp(valtemp+1, unid);
    if ('c'==unid || 'C'==unid)
		printf(" %fC vale %fF", valtemp+1, res);
	else
		printf(" %fF vale %fC", valtemp+1, res);	
	return (0);
}
