#include <stdio.h>
int main() {
FILE *fp = NULL;
char ch, my_file[50]= "ficheiroExe1.txt"; //tipo TXT
unsigned int i=0; char S1[100]="";
puts("Digite um frase:");
fgets(S1, sizeof(S1), stdin);//ler a string
if ((fp = fopen(my_file,"w"))==NULL){ // Cria ficheiro "w"
printf("Impossível Criar o ficheiro %s \n",my_file);
return(-1);
}
//Escrever em maiusculas para o ficheiro
while(S1[i]!=0){
if (S1[i]<='z' && S1[i]>='a')
ch = S1[i] -('a' - 'A');
else
ch = S1[i];
fputc(ch,fp); //escreve char no ficheiro
i++;
}
fclose(fp); //Importante fechar o FILE *
return (1);
}
