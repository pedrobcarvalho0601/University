#include <stdio.h>

int main ()
{

	char string[100];
	int tam=0;
	printf("escreva uma frase curta\n");
	scanf(" %99[^\n]", string);
	
	int min=0;
	
	for(char *p= string; *p != '\0'; p++)
		{
		tam++;
		if (*p>='a' && *p<='z')
			min++;
		}
		
	printf("letras minusculas e: %d\n", min);
	printf (" tamanho e %d\n",tam);

return(0);
}
