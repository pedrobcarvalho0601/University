#include <stdio.h>

float calculopico(float rms)
{
	float picovalor;
	picovalor = rms*1.4142;
	
	return(picovalor);
}


int main()
{
	float valor_rms;
	printf("escreva o valor valor_rms \n");
	scanf(" %f", &valor_rms);
	
	float valor_pico;
	
	valor_pico = calculopico( valor_rms);
	
	printf ("o valor pico e %f",valor_pico);
	
	return(0);
}
