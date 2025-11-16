#include <stdio.h>

int main()
{
	
	//treino de alteracao de caracteres
	
	char c;
	
	printf("digite um caracter: ");
	scanf("%c", &c );
	
	if (c>='a' && c<='z'){
		printf("passar para maiusculo: %c", c-32);
	}	else if (c>='A' && c<='Z'){
		printf("passar para minusculo: %c", c+32);
	}	else{ printf("nao e caracter");}
	
	
	return(0);
}
