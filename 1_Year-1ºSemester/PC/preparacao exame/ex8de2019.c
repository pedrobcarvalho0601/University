#include <stdio.h>

void contLetras(FILE *file, int *tab, int *d) {

	char c;
	int d=0;
	while ((c=fgetc(file))!= EOF ){
		if (c>='a' && c<='z'){
			tab[c-'a']++;
			d++;
		}
		if (c>='A' && c<='Z'){
			tab[c-'A']++;
			d++;
		}
}
}
void porOrdem(int *tab char *tindex, int *d) {
	
	for(int i=0;i<26;i++){
	tindex[i]='A'+i;
	}

//ordernar 
	
	for(i=0;i<d;i++)
	if(tab[])
}
int main(){
	
	FILE *file = fopen("seu_arquivo.txt", "r");
	if (file==NULL){
		printf("erro, ficheiro nao existe");
		return(1);
	}
	
	int tab[26]={0};
	char tindex[26];
	
	contLetras(file, tab);
	porOrdem( tindex);
	
	fclose(file);
	
	
	for(int i=0;i<26;i++){
		printf("%c : %d \n", tindex[i], tab[i]);
	}
	
    return 0;
}
