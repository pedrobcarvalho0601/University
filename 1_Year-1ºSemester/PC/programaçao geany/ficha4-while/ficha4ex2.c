#include <stdio.h>
int main()
{ 
	float x,y,max,menor,media,val,a;
	
	printf("escreva dois numeros reais diferentes\n");
	scanf (" %f %f", &x, &y);
	
	max = x>y ? x : y ;
	menor = x<y ? x : y ;
	printf("o maximo entre os dois numeros e: %f \n", max);
	
	media = (x+y)/2 ;
	
	a = media / menor;
	val = (a==2)  ? media : 0 ;
	
	printf(" a media e: %f \n", val );
	
	return (0);
}
