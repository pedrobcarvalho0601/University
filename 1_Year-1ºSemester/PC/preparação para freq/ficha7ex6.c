#include <stdio.h>

int fun_ceil(int x)
{
   if (x > 0) {
        return(x + 1);
    } else {
        return(x);
    }
}
int main() {
    
    double numero;
    printf ("escreve numero\n");
    scanf(" %lf", &numero);
    
    int teto = fun_ceil(numero);

    printf("O teto de %.2lf e %d\n", numero, teto);

    return 0;
}
