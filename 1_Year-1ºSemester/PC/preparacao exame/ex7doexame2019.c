#include <stdio.h>
#include <ctype.h>

#define NUM_LETRAS 26

int contaLetras(char *nomef, int *tab) {
    FILE *arquivo;
    char c;

    // Inicializa a tabela com zeros
    for (int i = 0; i < NUM_LETRAS; i++) {
        tab[i] = 0;
    }

    // Abre o arquivo para leitura
    arquivo = fopen(nomef, "r");

    // Verifica se o arquivo foi aberto com sucesso
    if (arquivo == NULL) {
        return 0; // Retorna 0 em caso de erro na abertura do arquivo
    }

    // Processa o conteúdo do arquivo
    while ((c = fgetc(arquivo)) != EOF) {
        // Verifica se o caractere é uma letra
        if (isalpha(c)) {
            // Converte o caractere para minúsculo e atualiza a tabela
            tab[tolower(c) - 'a']++;
        }
    }

    // Fecha o arquivo
    fclose(arquivo);

    return 1; // Retorna 1 em caso de sucesso na leitura do arquivo
}

int main() {
    char nome_arquivo[] = "exemplo.txt"; // Substitua pelo nome do seu arquivo
    int tabela_frequencia[NUM_LETRAS];

    // Chama a função e verifica se houve erro na abertura do arquivo
    if (contaLetras(nome_arquivo, tabela_frequencia) == 0) {
        printf("Erro na abertura do arquivo.\n");
        return 1;
    }

    // Exibe a tabela de frequência
    for (int i = 0; i < NUM_LETRAS; i++) {
        printf("%c: %d\n", 'a' + i, tabela_frequencia[i]);
    }

    return 0;
}
