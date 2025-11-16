#include <stdio.h>

int main() {

    int array[7] = {2, 3, 4, 5, -1, -2, 0};
    int tamanho = sizeof(array) / sizeof(array[0]);

    // Exibição dos valores do array antes da modificação
    printf("Valores do array antes da modificacao:\n");
    for (int i = 0; i < tamanho; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    // Utilizando um ponteiro para modificar os valores do array para o dobro
    int *ponteiro = &array[0];
    do {
        *ponteiro = *ponteiro * 2;
        ponteiro++;
    } while (ponteiro < array + tamanho);

    // Exibição dos valores do array depois da modificação
    printf("Valores do array depois da modificacao:\n");
    for (int i = 0; i < tamanho; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");

    return 0;
}
