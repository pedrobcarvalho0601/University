function [a2, a1, a0] = RegressaoQuadratica(x, y)
% RegressaoQuadratica - recorre à aproximação por mínimos quadrados para
% ajustar uma curva quadrática y(x) = a2x^2 + a1*x + a0.
% [a2, a1, a0] = RegressaoQuadratica (x, y)
% x, y : vetores contendo os dados a aproximar. x e y devem ser
% o mesmo número de elementos (NÃO é feita a verificação
% na função).
% a2, a1, a0: coeficientes do polinómio y(x)
n = length(x);
Sumx = sum(x); Sumy = sum(y);
Sumx2 = sum(x.^2); Sumx3 = sum(x.^3); Sumx4 = sum(x.^4);
Sumxy = sum(x.*y); Sumx2y = sum(x.^2.*y);
% Definição do sistema de equações
A = [n Sumx Sumx2;
 Sumx Sumx2 Sumx3;
 Sumx2 Sumx3 sSumx4];
b = [Sumy; Sumxy; Sumx2y];
w = A\b; % Resolve o sistema de equações
a0 = w(1); a1 = w(2); a2 = w(3);
