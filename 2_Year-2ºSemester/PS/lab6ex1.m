clear, clc, close all

syms x y;

f = (x^2+3*x-1)/(x^2-x);
fprintf("primeira derivada de x de f(x)")
dif_f = simplify(diff(f,x))
fprintf("segunda derivada de x de f(x)")
dif_f = simplify(diff(dif_f,x))

g = y^3*sin(x)+x^2*tan(y);

dif_gy = diff(g,x);
fprintf("segunda derivada de y de g(x,y)")
dif_gy = simplify(diff(dif_gy,y))
fprintf("primeira derivada de x de g(x,y)") 
dif_gx = simplify(diff(g,x))

h = (cos(x)+1)/(sin(x))^2;
fprintf("integral de h(x)")
hx = simplify(int(h))

k = exp(x)+1/(x^2+1);
fprintf("integral de k(x) de 0 ate 2")
kx = simplify(int(k, 0, 2))
double(kx)
