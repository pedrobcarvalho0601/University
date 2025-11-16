clc, clear;

% Identificação dos períodos
N_x = 8; % Período de x[n]
N_y = 10; % Período de y[n]
N_z = lcm(N_x, N_y); % Mínimo múltiplo comum

% Definição das funções x[n] e y[n]
n_x = 0:N_x-1;
n_y = 0:N_y-1;
n_z = 0:N_z-1;

x = sin((2*pi/8) * n_x);
y = cos((3*pi/5) * n_y);
z = sin((2*pi/8) * n_z) + cos((3*pi/5) * n_z);

% Plot dos sinais
figure;
subplot(3,1,1); stem(n_x, x, "filled"); title('Sinal x[n]');
subplot(3,1,2); stem(n_y, y, "filled"); title('Sinal y[n]');
subplot(3,1,3); stem(n_z, z, "filled"); title('Sinal z[n]');

% Cálculo dos coeficientes de Fourier utilizando FFT
a_x = fft(x)/N_x;
a_y = fft(y)/N_y;
a_z = fft(z)/N_z;

subplot(3,1,1); stem(n_x, abs(a_x), "filled"); title('Sinal x[n]');
subplot(3,1,2); stem(n_y, abs(a_y), "filled"); title('Sinal y[n]');
subplot(3,1,3); stem(n_z, abs(a_z), "filled"); title('Sinal z[n]');