clear; clc; close all;

% Planta
s = tf('s');
G = 4 / (s*(s+3));

% Polo desejado
sd = -7 + 6.8j;

% Fase da planta no ponto desejado
ang_G = angle(evalfr(G, sd)) * 180/pi;

% Ângulo necessário para satisfazer condição de fase (-180°)
phi_req = -180 - ang_G; 
phi_req = mod(phi_req+180, 360) - 180; % ajustar para -180 a 180
disp(['Fase da planta = ', num2str(ang_G), '°, Fase necessária do compensador = ', num2str(phi_req), '°'])

% Escolha do zero do compensador (ajuste prático)
z_c = 2; % escolha inicial
% Encontrar polo do compensador tal que gere o ângulo necessário
theta = phi_req * pi/180;

% Cálculo geométrico do polo do compensador
% |s + zc| e |s + pc| devem satisfazer diferença de ângulo = phi_req
p_c = real(sd) - (imag(sd)/tan(theta) + imag(sd)/tan(angle(sd+z_c)));
disp(['Zero: ', num2str(z_c), ', Polo: ', num2str(p_c)])

% Compensador
Gc = (s + z_c)/(s + p_c);

% Sistema compensado
G_total = Gc*G;

% Ajuste do ganho K para |G_total(sd)| = 1
Kc = 1/abs(evalfr(G_total, sd));
Gc = Kc*Gc;
disp(['Ganho Kc = ', num2str(Kc)]);

% Malha aberta e fechada
L = Gc*G;
T = feedback(L, 1);

% Exibir resultados
figure;
rlocus(L);
hold on;
plot(real(sd), imag(sd), 'r*', 'MarkerSize', 10)
title('Lugar das Raízes com Compensador de Avanço');
grid on;

% Resposta ao degrau e rampa
t = 0:0.001:3;
figure;
step(T, t)
title('Resposta ao Degrau - Sistema Compensado');

% Resposta à rampa
figure;
lsim(T, t, t)
title('Resposta à Rampa - Sistema Compensado');

% Sistema sem compensação
T0 = feedback(G, 1);

figure;
step(T0, t);
title('Resposta ao Degrau - Sistema Sem Compensação');
