#include <stdio.h>

struct Jogador {
    int numerocamisola;
    int idade;
    char nome[50];
    float altura;
   
};

void regista(int *numerocamisola, int *idades, struct Jogador *jogadores){
	
	for(int i=0;i<25;i++){
	printf("qual a idade do %d jogador e o numero da camisola?", i+1);
	scanf(" %d %d", &numerocamisola[i], &idades[i]);
	
	    for (int i = 0; i < 25; i++) {
        printf("Jogador %d:\n", i + 1);
        printf("Número da camisola: ");
        scanf("%d", &jogadores[i].numerocamisola);
        printf("Idade: ");
        scanf("%d", &jogadores[i].idade);
        printf("Nome: ");
        scanf("%s", jogadores[i].nome);
        printf("Altura: ");
        scanf("%f", &jogadores[i].altura);
	}
}
}
int guardanovos(int *numerocamisola, int *idades) {
	
	FILE *ficheiro;
    ficheiro = fopen("futebol.txt", "w");
    
    if (ficheiro == NULL) {
        printf("Erro ao abrir o ficheiro.\n");
        return 0;
    }
		
    int count=0;

	for(int i=0;i<25;i++){
		if(idades[i]<20){
			fprintf(ficheiro, "camisola %d tem %d anos\n", numerocamisola[i], idades[i]);
			count++;
		}
	}
	fclose(ficheiro);
	
	return(count);
}


int main(){
	
	int numerocamisola[25], idades[25];
	int count;
	struct Jogador jogadores[25];
	regista(numerocamisola, idades, jogadores);
	count=guardanovos(numerocamisola, idades);
	
	printf("\nNúmero de jogadores com menos de 20 anos: %d\n", count);
	
    return 0;
}
