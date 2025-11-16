#include <stdio.h>

struct cinema{
	char filme[41];
	int nbilhetes;
};

int Totalbilhetes(struct cinema filmes[], int nfilmes ){
	int totalbilhetes=0;
	for (int i=0;i<nfilmes;i++){	
		totalbilhetes=totalbilhetes+filmes[i].nbilhetes;
	}
		return totalbilhetes;
}

int maisbilhetes(struct cinema filmes[], int nfilmes ){
	int maiorb=0;
	int ind;
	for (int i=0;i<nfilmes;i++){
		if(filmes[i].nbilhetes>maiorb){
			maiorb=filmes[i].nbilhetes;
			ind=i;
		}
	}
	return ind;
}
	
int main()
{
	int nfilmes;
	printf("numero de filmes disponiveis\n");
	scanf("%d",	&nfilmes);
	
	while (getchar() != '\n');
	
	struct cinema filmes[nfilmes];
	
	for(int i=0;i<nfilmes;i++)
	{
		printf("escreva o nome do filme %d\n", i+1);
		scanf("%s", filmes[i].filme);
	
		printf("escreva o numero de bilhetes vendidos\n");
		scanf("%d",&filmes[i].nbilhetes);
		while (getchar() != '\n');
	}
	int totalbilhetes=Totalbilhetes(filmes, nfilmes);
	
	printf("\nTotal de bilhetes vendidos: %d\n", totalbilhetes);
	
	int maisvendido=maisbilhetes(filmes, nfilmes);
		
	printf("o filme %s foi vendeu o que vendeu o maior numero de bilhetes: %d ",filmes[maisvendido].filme,filmes[maisvendido].nbilhetes);
	
	return 0;
}
