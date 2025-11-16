#include <stdio.h>
#include <string.h>

// Definindo a struct para armazenar informações sobre os filmes
struct Filme {
    char nome[41];  // O nome do filme não pode ter mais do que 40 caracteres
    int bilhetesVendidos;
};

// Função para calcular o total de bilhetes vendidos
int calcularTotalBilhetes(struct Filme filmes[], int totalFilmes) {
    int total = 0;
    for (int i = 0; i < totalFilmes; i++) {
        total += filmes[i].bilhetesVendidos;
    }
    return total;
}

// Função para encontrar o índice do filme com mais bilhetes vendidos
int indiceFilmeMaisVendido(struct Filme filmes[], int totalFilmes) {
    int indice = 0;
    int maxBilhetes = filmes[0].bilhetesVendidos;

    for (int i = 1; i < totalFilmes; i++) {
        if (filmes[i].bilhetesVendidos > maxBilhetes) {
            maxBilhetes = filmes[i].bilhetesVendidos;
            indice = i;
        }
    }

    return indice;
}

int main() {
    // Inicializando a tabela com a informação dos filmes
    struct Filme filmes[] = {
        {"Harry Potter e a Pedra Filosofal", 80},
        {"O Regresso de Mary Poppins", 30},
    };

    // Calculando o total de bilhetes vendidos
    int totalBilhetes = calcularTotalBilhetes(filmes, sizeof(filmes) / sizeof(filmes[0]));
    printf("Total de bilhetes vendidos: %d\n", totalBilhetes);

    // Encontrando o índice do filme mais vendido
    int indiceMaisVendido = indiceFilmeMaisVendido(filmes, sizeof(filmes) / sizeof(filmes[0]));
    printf("O filme mais vendido foi: %s\n", filmes[indiceMaisVendido].nome);
    printf("Número de bilhetes vendidos do filme mais vendido: %d\n", filmes[indiceMaisVendido].bilhetesVendidos);

    return 0;
}
