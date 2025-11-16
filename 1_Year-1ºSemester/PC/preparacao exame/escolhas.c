#include <stdio.h>

int main()
{
	printf("escolha uma opcao apenas uma e correta\n");
	
	char escolha;
	int i=0;
	
	printf("Escolha uma opcao (A ou B):\n\n");

	while(i!=1){
		
		printf("opcao A: amo o pedro \n");
		printf("opcao B: nao amo o pedro \n\n");
		scanf(" %c", &escolha);
		
		switch (escolha){
			case 'A': 
			case 'a': 
				printf("tbm te amo <3\n");
				i=1;
				break;
			case 'B':
			case 'b': 
				printf("ESCOLHA ERRADA >:( \n");
				printf("ESCOLHA NOVAMENTE \n\n");
				break;
			default:
				printf("escolha apenas entre A ou B \n\n");
			}
	}
	printf("YHEY <3");
	
	return 0;
}
