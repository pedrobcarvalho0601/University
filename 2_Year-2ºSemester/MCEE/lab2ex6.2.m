clc, clear;

val = input('indique o valor, para para ponha zero');

pares = mod(val,2)==0;
impar = mod(val,2)~=0;

while(val!=0)

    input('indique o valor, para para ponha zero');
    pares = mod(val,2)==0;
    impar = mod(val,2)~=0;
end;