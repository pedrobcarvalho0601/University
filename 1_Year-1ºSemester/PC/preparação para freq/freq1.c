#include <stdio.h>

int main() {
    int numero, i, totalPares = 0;

    // Obter um número no intervalo [4, 40]
    do {
        printf("Digite um numero inteiro no intervalo 4 e 40 \n");
        scanf(" %d", &numero);
    } while (numero < 4 || numero > 40);

    // Pedir e contar números inteiros
    for (i = 0; i < numero; i++) {
        printf("Digite o %d o numero inteiro: ", i + 1);
        int num;
        scanf("%d", &num);
        if (num % 2 == 0)
        totalPares++;
    }

    // Exibir o resultado
    printf("\n Numeros pares digitados: %d\n", totalPares);

    return 0;
}
