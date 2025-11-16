
clc; clear; close all;

% Dados da Tabela 3 (b)
x = [0.40, 1.30, 2.00, 2.40, 3.30, 4.20];
y = [4.90, 5.70, 6.30, 6.10, 7.20, 8.50];

% (a) e (c) Implementar funções de regressão
[a1, a0] = RegressaoLinear(x, y);
[a3, a2, a1_cubic, a0_cubic] = RegressaoCubica(x, y);

p1 = @(x) a1*x + a0;  % Polinômio linear
p3 = @(x) a3*x.^3 + a2*x.^2 + a1_cubic*x + a0_cubic;  % Polinômio cúbico

% (d) Gerar gráfico dos dados e polinômios
x_plot = linspace(min(x), max(x), 100);

figure;
hold on;
plot(x, y, 'ko', 'MarkerSize', 8, 'LineWidth', 2); % Dados reais
plot(x_plot, p1(x_plot), 'b-', 'LineWidth', 2); % Regressão linear
plot(x_plot, p3(x_plot), 'r-', 'LineWidth', 2); % Regressão cúbica

xlabel('x'); ylabel('y');

legend('Dados', 'Regressão Linear', 'Regressão Cúbica', 'Location', 'best');
title('Ajuste Polinomial');
grid on;
hold off;

% (e) Criar tabela de comparação
e1 = y - p1(x);  % Erro linear
e3 = y - p3(x);  % Erro cúbico
% fprintf('\nTabela de Comparação:\n');
fprintf(' x      y       p1(x)    e1(x)    p3(x)    e3(x)\n');
fprintf('\n');
for i = 1:length(x)
    fprintf('%4.2f   %4.2f   %6.2f   %6.2f   %6.2f   %6.2f\n', x(i), y(i), p1(x(i)), e1(i), p3(x(i)), e3(i));
end

% (f) Solicitar um valor de x ao usuário e calcular os polinômios
x_user = input('\nIndique um valor de x para calcular p1(x) e p3(x): ');
y1_user = p1(x_user);
y3_user = p3(x_user);
fprintf('p1(x = %.1f) = %.2f\n', x_user, y1_user);
fprintf('p3(x = %.1f) = %.2f\n', x_user, y3_user);


function [a1, a0] = RegressaoLinear(x, y)
    p = polyfit(x, y, 1); 
    a1 = p(1);
    a0 = p(2);
end

function [a3, a2, a1, a0] = RegressaoCubica(x, y)
    p = polyfit(x, y, 3); 
    a3 = p(1);
    a2 = p(2);
    a1 = p(3);
    a0 = p(4);
end