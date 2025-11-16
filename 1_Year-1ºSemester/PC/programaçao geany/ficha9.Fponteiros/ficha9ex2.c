#include <stdio.h>

int main() {
    // Tamanho máximo da string
    int tamanhoMaximo = 100;

    // Declaração da string
    char frase[tamanhoMaximo];

    // Pedir ao utilizador para escrever uma string
    printf("Digite uma frase (máximo de %d caracteres):\n", tamanhoMaximo - 1);
    scanf(" %99[^\n]", frase);

    // Inicializar contadores
    int contadorCaracteres = 0;
    int contadorEspacos = 0;

    // Contar caracteres e espaços na string
    for (int i = 0; frase[i] != '\0'; i++) {
        contadorCaracteres++;

        if (frase[i] == ' ') {
            contadorEspacos++;
        }
    }

    // Exibir resultados
    printf("Número total de caracteres: %d\n", contadorCaracteres - 1);  // Descontar o caractere de nova linha (\n)
    printf("Número de espaços: %d\n", contadorEspacos);

    return 0;
}
