#include <stdio.h>

	typedef struct {
		int ano, mes, dia;
	} Data;
	
	
	typedef struct
	{
		char nome[30];
		char sexo;
		long int tel;
		Data nascimento;
	}Pessoa;
	
	int main()
	{
		//file
		
		FILE  *ficheiro;
		ficheiro=fopen("Registo_exe4.txt","w");
		
		if (ficheiro==NULL){
		printf("nao foi possivel abrir o ficheiro. \n");
		return (1);
	}
		//indentificacao
		
		Pessoa pessoa01;
		Pessoa pessoa02;
		
		printf ("digite o nome da pessoa\n");
		scanf (" %s", pessoa01.nome);
				
		printf ("digite o sexo da pessoa\n");
		scanf (" %c", &pessoa01.sexo);

		printf ("digite o tel da pessoa\n");
		scanf (" %ld", &pessoa01.tel);

		printf ("digite o nascimento pessoa __/__/____\n");
		scanf ("%d%d%d", &pessoa01.nascimento.dia, &pessoa01.nascimento.mes, &pessoa01.nascimento.ano);
		
		printf ("digite o nome da pessoa\n");
		scanf (" %s", pessoa02.nome);
		
		printf ("digite o sexo da pessoa\n");
		scanf (" %c", &pessoa02.sexo);

		printf ("digite o tel da pessoa\n");
		scanf (" %ld", &pessoa02.tel);

		printf ("digite o nascimento pessoa __/__/____\n");
		scanf ("%d%d%d", &pessoa02.nascimento.dia, &pessoa02.nascimento.mes, &pessoa02.nascimento.ano);	

		fprintf(ficheiro, "\nDados da Pessoa:\n");
		fprintf(ficheiro, "Nome: %s \n", pessoa01.nome);
		fprintf(ficheiro, "Sexo: %c\n", pessoa01.sexo);
		fprintf(ficheiro, "Telemovel: %ld\n", pessoa01.tel);
		fprintf(ficheiro, "Nascimento: %d / %d / %d\n", pessoa01.nascimento.dia, pessoa01.nascimento.mes, pessoa01.nascimento.ano);
		
		fprintf(ficheiro, "\nDados da Pessoa:\n");
		fprintf(ficheiro, "Nome: %s \n", pessoa02.nome);
		fprintf(ficheiro, "Sexo: %c\n", pessoa02.sexo);
		fprintf(ficheiro, "Telemovel: %ld\n", pessoa02.tel);
		fprintf(ficheiro, "Nascimento: %d / %d / %d\n", pessoa02.nascimento.dia, pessoa02.nascimento.mes, pessoa02.nascimento.ano);	
		
		fclose(ficheiro);

		return(0);
		
	}
		

