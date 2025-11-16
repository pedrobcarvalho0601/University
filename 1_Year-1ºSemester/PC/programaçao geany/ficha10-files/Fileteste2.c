#include <stdio.h>
int main() {
FILE *fp = NULL;
char ch='\0', my_file[50]="ficheiroExe1.txt"; //tipo TXT
puts("Vamos ler o conteudo do ficheiro:");
puts(my_file);
fp = fopen(my_file,"r"); // LER ficheiro "r"
if (fp==NULL) {
printf("Impossível Abrir o ficheiro %s \n",my_file);
return(-1);
}
//Imprimir conteudo do ficheiro no ecra
while (ch != EOF){
ch = fgetc(fp);
putchar(ch); //imprime no ecra um caractere
}
fclose(fp); //Importante fechar o FILE *
return (1);
} 
