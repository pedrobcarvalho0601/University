#include <stdio.h>

struct Endereco {
    int id;
    char rua[50];
    char localidade[30];
    long int CPostal;
};

struct Casa {
    struct Endereco endA;
    struct Endereco endB;
}casa;

void mostra_end(struct Endereco endereco) {
    printf("Endereco A ( %d, %s, %s, %ld)\n", endereco.id, endereco.rua, endereco.localidade, endereco.CPostal);
}

int main() {
    

//casa A
    printf("Digite os detalhes do endereco A:\n");
    printf("ID: ");
    scanf("%d", &casa.endA.id);
    printf("Rua: ");
    scanf("%s", casa.endA.rua);
    printf("Localidade: ");
    scanf("%s", casa.endA.localidade);
    printf("Codigo Postal: ");
    scanf("%ld", &casa.endA.CPostal);

    mostra_end(casa.endA);
 
 //Casa B   
    printf("Digite os detalhes do endereco A:\n");
    printf("ID: ");
    scanf("%d", &casa.endB.id);
    printf("Rua: ");
    scanf("%s", casa.endB.rua);
    printf("Localidade: ");
    scanf("%s", casa.endB.localidade);
    printf("Codigo Postal: ");
    scanf("%ld", &casa.endB.CPostal);

    mostra_end(casa.endB);
 
    return 0;
}

