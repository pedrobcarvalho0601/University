clc; clear; close all;

% Definição da função
f = @(x) (exp(-0.5.*x) .* sin(2.*x).^2) ./ (x + 4).^2;

% Parâmetros do intervalo e número de pontos
a = 0;
b = 3;
N = 61;

% Cálculo da derivada usando os três métodos
[df_forward, X_F] = NumDiff(f, a, b, N, 'forward');
[df_backward, X_B] = NumDiff(f, a, b, N, 'backward');
[df_central, X_C] = NumDiff(f, a, b, N, 'central');

% Plotagem dos resultados
figure;
plot(X_F, df_forward, 'r', 'LineWidth', 1.5); hold on;
plot(X_B, df_backward, 'b', 'LineWidth', 1.5);
plot(X_C, df_central, 'y', 'LineWidth', 1.5);
xlabel('X'); ylabel('df/dx');
title('Atividade 1');
legend('Forward', 'Backward', 'Central');
grid on;

