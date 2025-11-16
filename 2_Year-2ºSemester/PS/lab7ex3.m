clc; clear; close all;

x = [0 22.65 58.43 117.71 196.93 255.19 297.1 378.36 485.17 532.19 554.17]; % Tensão (V)
y = [0 13.52 23.15 27.14 21.44 13.98 8.63 5.36 11.71 24.11 32.58]; % Corrente (mA)


grau = 9;

p = polyfit(x, y, grau);

p_fit = @(x) polyval(p, x);

% Gerar pontos para o gráfico
x_plot = linspace(min(x), max(x), 10000);
y_fit = p_fit(x_plot);



E = sum((y - p_fit(x)).^2);

% Gerar gráfico
figure;
hold on;

plot(x, y, 'bo', 'MarkerSize', 8, 'LineWidth', 2); % Dados experimentais
plot(x_plot, y_fit, 'r-', 'LineWidth', 2); % Curva ajustada

xlabel('Tensão (V)');
ylabel('Corrente (mA)');

title(sprintf('Ajuste Polinomial (Grau %d)', grau));
legend('Dados experimentais', 'Regressão Polinomial', 'Location', 'best');
grid on;
hold off;

% Exibir soma dos quadrados dos erros
fprintf('Soma dos quadrados dos erros (E) para grau %d: %.4f\n', grau, E);