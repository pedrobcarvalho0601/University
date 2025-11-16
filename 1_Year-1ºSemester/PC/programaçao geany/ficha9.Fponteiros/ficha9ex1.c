#include <stdio.h>

void fun_exe1(const float x[], int N, float *max, float *min, float
*soma, float *media)
{
	
	*max=x[0];
	*min=x[0];
	*soma=0;
	*media=0;
	
	for (int i=0;i<N;i++)
	{
		if(*max<x[i+1]){
			*max=x[i+1];
		}
		if(*min>x[i+1]){
			*min=x[i+1];
		}
		else 
		{
			i++;
		}
	}
		int i=0;
	while(i<=N)
	{
		*soma=*soma+x[i];
		i++;	
	}	
	
	*media=*soma/N;	
}

int main()
{
	const float a[]={0.1, 1.2, 2.3, -3.4, 4.5, 5.6, 16.7, 8.8, -9.9, 10.0};
	int N = sizeof(a) / sizeof(a[0]);
	
	float max1,min1,soma1,media1;
	
	fun_exe1(a,N,&max1, &min1, &soma1, &media1);
	
	printf(" maximo %0.1f \n",max1);
	printf(" minimo %0.1f \n",min1);
	printf(" soma %0.1f \n",soma1);
	printf(" media %0.2f \n",media1);
	return 0;
	
}

