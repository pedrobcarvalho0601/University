#include <stdio.h>
#include <math.h>

float my_func_err (float x1, float y1){
	float z=0.0;
	z = (x1 - y1)*(x1 - y1);

	printf("Endereco de x: %p \n Enderco de y: %p \n", &x1, &y1);
	
return z;
}


int main()
{
	float x,y,z;
	
	printf("\n escolha um valor real para x e y \n");
	scanf(" %f %f", &x,&y);
	
	printf("Endereco de x: %p \n Enderco de y: %p\n\n ", &x, &y);
	
	z=my_func_err (x,y);

	printf("\n o valor e: %f ", z );

return(0);
}
