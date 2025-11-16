clc; clear; close all;

%% Definir parâmetros
N = 100; % Período do sinal
n = 0:N-1; % Intervalo de um período
x = zeros(1, N); % Inicializa o vetor do sinal periódico
x(mod(-4:4, N) + 1) = 1; % Definição do padrão 1 em n=-4:4

%% Cálculo dos coeficientes de Fourier
ak = fft(x)/N; % Coeficientes da série de Fourier

%% Recuperação do sinal usando IFFT
x_reconstructed = ifft(ak * N); % Recupera o sinal original

%% Cálculo de X1(e^jw)
w = linspace(-pi, pi, 1001); % Frequências para o gráfico
X1 = sin(9*w)./sin(w); % Transformada do sinal aperiódico

% Coeficientes para comparação
k = -50:49;
ak_100 = ak(mod(k, N) + 1) * 100;

%% Plotagem em uma única janela com subplots
figure;

% Gráfico 1: Sinal Periódico x[n]
subplot(2,2,1);
stem(n, x, 'filled');
xlabel('n'); ylabel('x[n]');
title('Sinal Periódico x[n]');
grid on;

% Gráfico 2: Coeficientes de Fourier a_k
subplot(2,2,2);
stem(-N/2:N/2-1, fftshift(real(ak)), 'filled');
xlabel('k'); ylabel('a_k');
title('Coeficientes de Fourier a_k (Reais)');
grid on;

% Gráfico 3: Sinal Reconstruído com IFFT
subplot(2,2,3);
stem(n, real(x_reconstructed), 'filled');
xlabel('n'); ylabel('x_{rec}[n]');
title('Sinal Reconstruído a partir de a_k');
grid on;

% Gráfico 4: Comparação de X1(e^jw) e coeficientes de Fourier
subplot(2,2,4);
plot(w, abs(X1), 'b', 'LineWidth', 1.5); hold on;
stem(k * (2 * pi / N), abs(ak_100), 'ro', 'MarkerFaceColor', 'r');
xlabel('\omega'); ylabel('|X_1(e^{j\omega})|');
title('Comparação de X_1(e^{j\omega}) e a_k');
legend('|X_1(e^{j\omega})|', 'a_k');
grid on;

sgtitle('Análise do Sinal Periódico e sua Transformada'); % Título geral
