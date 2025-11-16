#include <stdio.h>

void manipula_tabela(int *ptr, int dim);

int main()
{
	int i;	
	int dim=10;
	int tabela[]={1,2,3,4,5,6,7,8,9,10}; 

	printf("Tabela original: ");
	for(i=0;i<9;i++){
		printf("%d -> ",tabela[i]);
	}
	printf("%d \n",tabela[9]);
	
	manipula_tabela(tabela,dim);
	
	printf("Tabela manipulada e invertida: ");
	for(i=0;i<9;i++){
		printf("%d -> ",tabela[i]);
	}
	printf("%d",tabela[9]);
		
return 0;
}
