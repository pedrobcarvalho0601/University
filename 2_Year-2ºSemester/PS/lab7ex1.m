clc, clear;

% Definição dos polinômios como vetores de coeficientes
p1 = [3 4];         % 3x + 4
p2 = [1 0 -10];    % x^2 - 10
p3 = [0.5 -0.5 -8 0]; % 0.5x^3 - 0.5x^2 - 8x
p4 = [-0.2 0 4 0 -2]; % -0.2x^4 + 4x^2 - 2

% Solicitar ao usuário um valor de x dentro do intervalo válido
while true
    x = input('Digite um valor de x no intervalo [-4, 4]: ');
    if x >= -4 && x <= 4
        break;
    else
        disp('Valor fora do intervalo. Tente novamente.');
    end
end

% Avaliação dos polinômios no valor de x
val1 = polyval(p1, x);
val2 = polyval(p2, x);
val3 = polyval(p3, x);
val4 = polyval(p4, x);

% Exibição dos resultados
fprintf('Para x = %.2f:\n', x);
fprintf('p1(x) = %.2f\n', val1);
fprintf('p2(x) = %.2f\n', val2);
fprintf('p3(x) = %.2f\n', val3);
fprintf('p4(x) = %.2f\n', val4);

% Representação gráfica dos polinômios
x_vals = linspace(-5, 5, 1000);
y1 = polyval(p1, x_vals);
y2 = polyval(p2, x_vals);
y3 = polyval(p3, x_vals);
y4 = polyval(p4, x_vals);

figure;
hold on;
plot(x_vals, y1, 'r', 'LineWidth', 2);
plot(x_vals, y2, 'b', 'LineWidth', 2);
plot(x_vals, y3, 'g', 'LineWidth', 2);
plot(x_vals, y4, 'm', 'LineWidth', 2);

plot(x, val1, 'k+');
plot(x, val2, 'k+');
plot(x, val3, 'k+');
plot(x, val4, 'k+');

r1=roots(p1);
r2=roots(p2);
r3=roots(p3);
r4=roots(p4);

fprintf('zeros p1(x) = %.2f\n', r1);
fprintf('p2(x) = %.2f\n', r2);
fprintf('p3(x) = %.2f\n', r3);
fprintf('p4(x) = %.2f\n', r4);

plot(r1, zeros(size(r1)), 'ro');
plot(r2, zeros(size(r2)), 'bo');
plot(r3, zeros(size(r3)), 'go');
plot(r4, zeros(size(r4)), 'mo');

grid on;

xlabel('x'); ylabel('p(x)');
title('Gráficos dos Polinômios');
legend('p1(x) = 3x + 4', 'p2(x) = x^2 - 10', 'p3(x) = 0.5x^3 - 0.5x^2 - 8x', 'p4(x) = -0.2x^4 + 4x^2 - 2', 'location', 'best' );