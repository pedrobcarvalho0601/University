#include <stdio.h>

int main() {
  int x,        /* base                         */ 
      n,        /* expoente                     */
      potencia, /* guarda as potencias parciais */ 
      contador; 
  
  printf("\n\tCalculo de potencias\n");
  printf("\nDigite um numero inteiro: ");
  scanf("%d", &x);
  printf("Digite um numero um inteiro nao-negativo: ");
  scanf("%d", &n);
  
  /* Inicializacoes */
  potencia = 1;
  contador = 0;
  
  /* Calculo da potencia */
  while (contador != n) {
    potencia = potencia * x;
    contador = contador + 1;
  }
  
  printf("\nO valor de %d elevado a %d: %d\n", x, n, potencia);
  return 0;
}
