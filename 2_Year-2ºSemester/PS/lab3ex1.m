clc, close

% Definição de parâmetros
N = 1000; % Período do sinal
n = 0:2000; % Intervalo de tempo para plot

% Definição do sinal x[n]
x_n = cos((2*pi*2*n)/N) - sin((2*pi*3*n)/N);

% (a) Verificação da periodicidade
figure;
stem(n, x_n, 'filled');
xlabel('n'); ylabel('x[n]');
title('Sinal x[n] para n = 0:2000');
grid on;

% (b) Plot de um período do sinal
figure;
stem(n(1:N), x_n(1:N), 'filled');
xlabel('n'); ylabel('x[n]');
title('Um período do sinal x[n]');
grid on;

% (c) Cálculo dos coeficientes de Fourier
x_periodic = x_n(1:N); % Pegando um período do sinal
ak = fft(x_periodic, N) / N; % Cálculo da FFT normalizada

% (c) Plot da magnitude dos coeficientes de Fourier
figure;
stem(0:N-1, abs(ak), 'filled');
xlabel('k'); ylabel('|a_k|');
title('Magnitude dos coeficientes de Fourier');
grid on;

% (d) Zoom para identificar coeficientes não nulos
figure;
stem(0:N-1, abs(ak), 'filled');
xlabel('k'); ylabel('|a_k|');
title('Zoom dos coeficientes não nulos');
xlim([0 50]); % Ajuste para visualizar os coeficientes principais
grid on;

% Exibir valores dos coeficientes não nulos
fprintf('Valores dos coeficientes não nulos:\n');
indices_nao_nulos = find(abs(ak) > 1e-3);
for i = 1:length(indices_nao_nulos)
    fprintf('k = %d, ak = %f + %fj\n', indices_nao_nulos(i), real(ak(indices_nao_nulos(i))), imag(ak(indices_nao_nulos(i))));
end

% (e) Gráfico com frequência normalizada
wn = (0:N-1) * (2*pi/N);
figure;
stem(wn, abs(ak), '^', 'filled');
xlabel('\omega_n'); ylabel('|a_k|');
title('Magnitude dos coeficientes de Fourier - Frequência Normalizada');
grid on;

% (f) FFT shift para centralizar k=0 no meio
af_shift = fftshift(ak);
k_shift = (-N/2:N/2-1);
figure;
stem(k_shift, abs(af_shift), 'filled');
xlabel('k'); ylabel('|a_k|');
title('Magnitude dos coeficientes de Fourier (FFT Shift)');
grid on;

% (g) Cálculo dos coeficientes de Fourier para y[n] com desvio de fase
y_n = cos((2*pi*2*n)/N + pi/4) - sin((2*pi*3*n)/N + pi/4);
bk = fft(y_n(1:N), N) / N;

% Removendo erros numéricos
bk(abs(bk) < 1e-10) = 0;

% Plot da fase dos coeficientes normalizados por pi
figure;
stem(0:N-1, angle(bk)/pi, 'filled');
xlabel('k'); ylabel('Fase (radianos / pi)');
title('Fase dos coeficientes de Fourier de y[n]');
grid on;
