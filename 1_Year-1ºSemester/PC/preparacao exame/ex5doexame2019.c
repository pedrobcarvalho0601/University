#include <stdio.h>

void alteraCapitalizacao(char *pt){
		char car;
		car=*pt;
		
		if(*pt>='a' && *pt<='z'){
			*pt = *pt-'a'+'A';
		}
		else if(*pt>='A' && *pt<='Z'){
			*pt = *pt-'A'+'a';
		}
		else{
			*pt = '?';
		}
	}
int main()
	{
		char c;
		printf("escreva um caracter\n");
		scanf("%c",&c) ;
		
		alteraCapitalizacao(&c);
		
		printf("%c ", c );

		return 0;
	}
		
		
