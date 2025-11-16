#include <stdio.h>
int main()
{
 
	char S[100]= {"Dep de Eng Eletro da Univ de Coimbra"};
	char U[100]= {"Dep de Eng Eletro da Univ de Coimbra"};
	int cont=0,i,e,j;
	
	 
	for (i=0;S[i]!='\0';i++)
	
	{ 
		if (S[i]>= 'a' && S[i]<='z') S[i] = S[i] - ('a'-'z');//se minuscula mete maiuscula
		if (U[i]>= 'A' && U[i]<='Z') U[i] = U[i] - ('A'-'Z');
		if (U[i]== ' ') cont++;
	}
	for(e=0;e<100;e++)
		{
			printf("\n %c", S[e]);
		}
		
	for(j=0;j<100;j++)
		{
			printf("\n %c", U[j]);
		}
	
	
	printf ("\n ha %d espacos",cont);	
		
	return (0);
}




