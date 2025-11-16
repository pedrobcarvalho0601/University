clc; clear; close all;

%% Definição dos parâmetros
W = 5/9; % Frequência de corte
n = 0:39; % Intervalo de n

%% Cálculo de x[n]
x = sin(W * n) ./ (pi * n); 

% Corrige o valor para n=0 (evita NaN)
x(n == 0) = W / pi;

%% Plot do sinal stem
figure;
stem(n, x, 'filled');
grid on;
xlabel('n'); ylabel('x[n]');
title('Sinal x[n] para W = 5/9');

%% Determinação de valores onde x[n] = 0
zeros_n = n(abs(x) < 1e-10); % Considera erro numérico
fprintf('Valores de n onde x[n] = 0: \n');
disp(zeros_n);

%% Cálculo da soma total das amostras e energia
total_sum = sum(x);
energy = sum(x.^2);

fprintf('Soma total das amostras: %.4f\n', total_sum);
fprintf('Energia do sinal: %.4f\n', energy);
                            