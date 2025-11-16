#include <stdio.h> 
int main()
{
	
	int a;
	printf("deseja converter fahrenheit para celcius clique 1 \nconverter celcius para fahrenheit para celcius clique 2 \n ");
	scanf(" %d", &a);
	
	if(a==1) 
		{
			float Fan, Cel;

			printf ("escreva a temperatura que deseja converter para celcius em fahrenheit ");
			scanf(" %f", &Fan);
	
			Cel= ((float)5/9)*(Fan-32);
	
			printf ("conversao: %f", Cel); 
		}
		if (a==2)
		{
			float Fan, Cel;

			printf ("escreva a temperatura que deseja converter para fahrenheit em celcius \n");
			scanf(" %f",&Cel);
	
			Fan= ((float)Cel/5*9)+32;
		
			printf ("conversao: %f", Fan); 
		}
		else 
			printf("opcao incorreta");
	
	return 0;
	}
