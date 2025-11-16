clc; clear; close all;
%% a) Pontos e Interpolação Polinomial
x = [0, pi/6, pi/3, pi/2];
y = x.^(1/2) .* sin(x);
p = polyfit(x, y, 3);
x_plot = linspace(0, pi/2, 100);
y_plot = x_plot.^(1/2) .* sin(x_plot);
y_poly = polyval(p, x_plot);

figure;
subplot(2,1,1);
plot(x_plot, y_poly, 'y', 'LineWidth', 1.5); hold on;
plot(x_plot, y_plot, 'r', 'LineWidth', 1.5);
plot(x, y, 'bo', 'LineWidth', 1.5); hold off;
xlabel('x'); ylabel('f(x)');
legend('polinómio', 'função', 'dados');
title('Interpolação f(x)');
grid on;

%% b) Derivada do Polinómio
dp = polyder(p);

%% c) Derivação Simbólica
syms xs;
f_sym = xs^(1/2) * sin(xs);
df_sym = diff(f_sym, xs);
df_func = matlabFunction(df_sym);

%% d) Gráfico das Derivadas
y_deriv_poly = polyval(dp, x_plot);
y_deriv_func = df_func(x_plot);

subplot(2,1,2);
plot(x_plot, y_deriv_poly, 'b', 'LineWidth', 1.5); hold on;
plot(x_plot, y_deriv_func, 'r', 'LineWidth', 1.5); hold off;
xlabel('x'); ylabel('y');
legend('dif. numérica', 'dif analítica');
title('Derivadas de f(x)');
grid on;

%% e) Erro Absoluto em x = 0.6
x_val = 0.6;
y_deriv_poly_val = polyval(dp, x_val);
y_deriv_func_val = df_func(x_val);
erro_absoluto = abs(y_deriv_poly_val - y_deriv_func_val);
fprintf('Erro absoluto em x = %.1f: %.6f\n', x_val, erro_absoluto);

%% f) Repetição para [pi/6, pi/4]
x2 = linspace(pi/6, pi/4, 4);
y2 = x2.^(1/2) .* sin(x2);
p2 = polyfit(x2, y2, 3);
dp2 = polyder(p2);
x_plot2 = linspace(pi/6, pi/4, 100);
y_plot2 = x_plot2.^(1/2) .* sin(x_plot2);
y_poly2 = polyval(p2, x_plot2);
y_deriv_poly2 = polyval(dp2, x_plot2);
y_deriv_func2 = df_func(x_plot2);

figure;
subplot(2,1,1);
plot(x2, y2, 'o', 'LineWidth', 1.5); hold on;
plot(x_plot2, y_plot2, 'b', 'LineWidth', 1.5);
plot(x_plot2, y_poly2, 'g', 'LineWidth', 1.5); hold off;
xlabel('x'); ylabel('f(x)');
legend('dados', 'função', 'polinómio');
title('Interpolação no intervalo [\pi/6, \pi/4]');
grid on;

subplot(2,1,2);
plot(x_plot2, y_deriv_poly2, 'b', 'LineWidth', 1.5); hold on;
plot(x_plot2, y_deriv_func2, 'c', 'LineWidth', 1.5); hold off;
xlabel('x'); ylabel('y');
legend('dif. numérica', 'dif analítica');
title('Derivadas no intervalo [\pi/6, \pi/4]');
grid on;

% Como usamos um polinômio de grau 3 para interpolar a função, este 
% aproxima bem os valores da função original nesse intervalo resultando
% nas sobreposição de linhas e num erro menor.
