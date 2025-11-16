#include <stdio.h>

void mostra_end(struct Endenreco endereco){
printf("endereco A ( %d, %c, %c, %ld)\n", casa.endereco.id, casa.endereco.rua, casa.endereco.localidade, casa.endereco.CPostal);
}

int main ()

{
	struct Endereco{
	int id;
	char rua[50];
	char localidade[30];
	long int CPostal;
	};

	struct CASA{
		struct endereco endA;
		struct endereco endB;
	};
	struct CASA casa;
	
	printf("escreva um endereco A");
	scanf("%d, %c, %c, %ld", casa.endereco.id, casa.endereco.rua, casa.endereco.localidade, casa.endereco.CPostal);
		
	mostra_end(endereco);
		
	return(0);
}
