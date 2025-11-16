#include <stdio.h>
#include <math.h> //sqrt

double valor_pico(double ve){
	float vp;
	
	vp= sqrt(2)*ve;
	
	return vp;
}

	int main ()
	{
		float ve,vp;
		
		printf("digite valor eficaz");
		scanf("%f", &ve);
		
		vp=valor_pico(ve);
		
		printf("%f",vp);
		
	return(0);
	}
