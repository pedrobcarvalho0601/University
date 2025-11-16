#include <stdio.h>

int main()
{
	FILE *fp=NULL;
	char my_file[50] = "ficha10ex1texto.txt";
	
	
	char S1[100]="";
	
	puts("escreva a frase");
	fgets(S1, sizeof(S1), stdin);
	
	if ((fp = fopen(my_file,"w"))==NULL){ 
		printf("Impossível Criar o ficheiro %s \n",my_file);
		return(-1);
	}
	
	
	fclose(fp);
	return(1);
}
