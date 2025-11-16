#include <stdio.h>

int remove_outliers(int *ptr, int dim, int LInf, int LSup);

int main()
{
  int tab[8]={30,-10, 50,130,80,40,20,60};
  
  int res=remove_outliers(tab, 8, 25,80);
  
  int i=0;
  int contador;
  printf("Tabela Resultante:  \n");
  for(i; i<=8;i++)
  {
    printf("indice i=%d \n", tab[i]);
    if(tab[i]==0){
    contador++;
    }
  }
  printf("Valor devolvido: %d \n", contador);
  
  
  return 0;
}
   