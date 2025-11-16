#include <stdio.h>

	int FunSalarios(double Sals[]){
		
		int i;
		
		for (i=0;i<100;i++){
			printf("introduza o valor do salario e zero para parar: ");
			scanf( "%lf", &Sals[i]);
			if (Sals[i]==0) break;		
		}
		return i;
	}
	double avalia(double Sals[], int n, double *maior, double *menor, double *media){	
		
		double soma;
		
		for(int i=0;i<n;i++){
			soma=Sals[i]+soma;

			if(Sals[i]>*maior){
				*maior=Sals[i];
			}else *menor=Sals[i];
		}
		
		*media=soma/n;
		
		return (soma);
	}
	
	int main(){
		
		double salarios[100];
		int numsalarios;
		
		numsalarios=FunSalarios(salarios);
		
		double soma, maior, menor, media;
		soma=avalia(salarios, numsalarios, &maior,  &menor,  &media);
		
		printf("\nInformacao sobre os salarios:\n");
        printf("Total de salarios: %d\n", numsalarios);
        printf("Soma de salarios: %lf\n", soma);
        printf("Maior salario: %lf\n", maior);
        printf("Menor salario: %lf\n", menor);
        printf("Media dos salarios: %lf\n", media);
        
        return 0;
	}
		
		
		
		
		
