function [a1, a0] = RegressaoLinear(x, y)
% RegressaoLinear - recorre à aproximação por mínimos quadrados para ajustar
% uma reta da forma y(x) = a1*x + a0.
%
% [a1, a0] = RegressaoLinear(x, y)
% x, y : vetores contendo os dados a aproximar. x e y devem ser o mesmo
% número de elementos (NÃO é feita a verificação na função).
% a1, a0: coeficientes do polinómio y(x)
% Coeficientes do sistema de equações
n = length(x);
Sumx = sum(x); % somatório de xi
Sumy = sum(y); % somatório de yi
Sumxx = sum(x.*x); % Somatório de xi^2
Sumxy = sum(x.*y); % Somatório de xi * yi
% Denominador das expressões obtidas pela Regra de Cramer
den = n*Sumxx - Sumx^2;
% Cálculo dos coeficientes a1 e a0
a1 = (n*Sumxy - Sumx*Sumy)/den;
a0 = (Sumxx*Sumy - Sumxy*Sumx)/den;
