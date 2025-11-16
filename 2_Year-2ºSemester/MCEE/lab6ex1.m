clear, clc, close all

syms x y;

f = (x^2+3*x-1)/(x^2-x);

dif_f = diff(f,x);
fprintf("segunda derivada de x de f(x)")
dif_f = diff(dif_f,x)

g = y^3*sin(x)+x^2*tan(y);

dif_gx = diff(g,x);
fprintf("segunda derivada de x de g(x,y)")
dif_gx = diff(dif_gx,x)
fprintf("primeira derivada de y de g(x,y)") 
dif_gy = diff(g,y)

h = (cos(x)+1)/(sin(x))^2;
fprintf("integral de h(x)")
hx = int(h)

k = (exp(x)+(1/x^2+1));
fprintf("integral de k(x) de 0 ate 2")
kx = int(k, 0, 2)
