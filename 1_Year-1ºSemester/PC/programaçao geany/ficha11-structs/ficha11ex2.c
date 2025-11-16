#include <stdio.h>

float calculo_media(float soma, int tam){

	float media=soma/tam;
	
	return(media);
}

int main()
{
	typedef struct{
		int id;
		double P_x, P_y;
		double features[3]; //array de features
	} Objecto;
	
	Objecto obj1 = {1,5.23,7.09,{1.66, 0.091, 0.913}};
	
	float soma;
	int i;
	int tam=3;
	for(i=0;i<3;i++)
	{
		soma=obj1.features[i]+soma;
	}
	
	float result=calculo_media(soma,tam);
	
	printf("media %f |id %d |px %f |py %f ", result, obj1.id, obj1.P_x, obj1.P_y);
	
	return(0);
}
	
	
	
	
	
