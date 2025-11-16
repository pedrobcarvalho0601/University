#include <stdio.h>

int main() {
    
    int x;
    float y;
    char c;

	printf("\n escolha um valor inteiro para x, real para y, e caracter para c \n \n");
	scanf(" %d %f %c", &x, &y, &c);

    
    int *pt_x = &x;    
    float *pt_y = &y;  
    char *pt_c = &c;   

    printf("Valor de x: %d\n", x);
    printf("Endereco de x: %p \n", &x);
    printf("ponteiro pt_x: %d \n\n", *pt_x);

    printf("Valor de y: %.2f\n", y);
    printf("Endereco de y: %p\n", &y);
    printf("ponteiro pt_y: %.2f\n\n", *pt_y);

    printf("Valor de c: %c\n", c);
    printf("Endereco de c: %p\n", &c);
    printf("ponteiro pt_c: %c\n", *pt_c);

    return 0;
}
