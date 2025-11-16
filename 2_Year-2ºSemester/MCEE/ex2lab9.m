clc, clear, close all;

func_str = input('diz a funcao:  ','s');
f=str2func(['@(x)',func_str]);

x_value = input('indique o valor x: ');
h = input('indique valor passo h: ');

df = richard(f, x_value, h);

fprintf('valor da derivada\n');
fprintf('f''(%.2f)= %.6f \n', x_value, df);

% (2*x+1)*exp(-3*x/4)
%Indique o valor de x: 1.5
% Indique o valor do passo h: 0.2