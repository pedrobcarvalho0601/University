clear,clc,close all

t = linspace(0, 10, 10);
y1 = exp(-0.4*t).*sin(t);
y2 = exp(-0.4*t).*cos(t);

figure; % abre uma nova janela de figuras
plot(t, y2, 'r', 'linewidth', 2);
grid on;
title('Figura 1');

figure; % abre uma segunda janela de figuras
plot(t, y2, 'b', 'linewidth', 2); 
grid on;
title('Figura 2');
