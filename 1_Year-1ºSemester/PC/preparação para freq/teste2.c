#include <stdio.h>

int main() {
    const int MAX_NOMES = 5;
    const int TAM_NOME = 50;
    
    char nomes[MAX_NOMES][TAM_NOME];

    printf("Insira os nomes de 20 pessoas:\n");

    for (int i = 0; i < MAX_NOMES; i++) {
        printf("Nome %d: ", i + 1);
        scanf("%s", nomes[i]);
    }

    printf("\nNomes inseridos:\n");
    for (int i = 0; i < MAX_NOMES; i++) {
        printf("%d. %s\n", i + 1, nomes[i]);
    }

    return 0;
}
