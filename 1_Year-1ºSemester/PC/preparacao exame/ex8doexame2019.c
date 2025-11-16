#include <stdio.h>

void contLetras(int *tab); // Supondo que você já tenha essa função implementada

void porOrdem(int *tab, int *tindex) {
    // Chame a função contLetras para preencher a tabela de frequência
    contLetras(tab);

    // Preencha tindex com índices ordenados por ordem decrescente
    for (int i = 0; i < 26; i++) {
        tindex[i] = i; // Inicializa tindex com valores de 0 a 25
        for (int j = i; j > 0 && tab[tindex[j]] > tab[tindex[j - 1]]; j--) {
            // Troca os índices se a frequência na posição atual for maior do que na posição anterior
            int temp = tindex[j];
            tindex[j] = tindex[j - 1];
            tindex[j - 1] = temp;
        }
    }
}

int main() {
    int tab[26];      // Sua tabela de frequência
    int tindex[26];   // Sua tabela de indexação

    // Chame porOrdem para preencher tindex com índices ordenados por ordem decrescente
    porOrdem(tab, tindex);

    // Agora tindex contém os índices ordenados por ordem decrescente da frequência em tab

    // Exemplo de impressão dos índices ordenados
    for (int i = 0; i < 26; i++) {
        printf("tindex[%d] = %d\n", i, tindex[i]);
    }

    return 0;
}
