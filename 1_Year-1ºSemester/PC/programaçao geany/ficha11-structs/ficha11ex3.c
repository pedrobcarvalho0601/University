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
		Pessoa pessoa01;
		
		printf ("digite o nome da pessoa\n");
		scanf (" %s", pessoa01.nome);
		
		printf ("digite o sexo da pessoa\n");
		scanf (" %c", &pessoa01.sexo);

		printf ("digite o tel da pessoa\n");
		scanf (" %ld", &pessoa01.tel);

		printf ("digite o nascimento pessoa __/__/____\n");
		scanf ("%d%d%d", &pessoa01.nascimento.dia, &pessoa01.nascimento.mes, &pessoa01.nascimento.ano);
		

		printf("\nDados da Pessoa:\n");
		printf("Nome: %s \n", pessoa01.nome);
		printf("Sexo: %c\n", pessoa01.sexo);
		printf("Telemovel: %ld\n", pessoa01.tel);
		printf("Nascimento: %d / %d / %d\n", pessoa01.nascimento.dia, pessoa01.nascimento.mes, pessoa01.nascimento.ano);

		return(0);
		
	}
		
