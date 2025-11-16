% Definição de parâmetros
N = 1000; % Período do sinal
n = 0:2000; % Intervalo de tempo para plot

% Definição dos sinais x[n] e y[n]
x_n = cos((2*pi*2*n)/N) - sin((2*pi*3*n)/N);
y_n = cos((2*pi*2*n)/N + pi/4) - sin((2*pi*3*n)/N + pi/4);

% (a) e (b) - Plots do sinal x[n]
figure;
subplot(3,2,1); stem(n, x_n, 'filled'); xlabel('n'); ylabel('x[n]'); title('Sinal x[n] para n = 0:2000'); grid on;
subplot(3,2,2); stem(n(1:N), x_n(1:N), 'filled'); xlabel('n'); ylabel('x[n]'); title('Um período do sinal x[n]'); grid on;

% (c) Cálculo dos coeficientes de Fourier
ak = fft(x_n(1:N), N) / N;

% (c) e (d) - Plot da magnitude dos coeficientes de Fourier
subplot(3,2,3); stem(0:N-1, abs(ak), 'filled'); xlabel('k'); ylabel('|a_k|'); title('Magnitude dos coeficientes de Fourier'); grid on;
subplot(3,2,4); stem(0:N-1, abs(ak), 'filled'); xlabel('k'); ylabel('|a_k|'); title('Zoom dos coeficientes não nulos'); xlim([0 50]); grid on;

% Exibir coeficientes não nulos
indices_nao_nulos = find(abs(ak) > 1e-3);
fprintf('Valores dos coeficientes não nulos:\n');
for i = 1:length(indices_nao_nulos)
    fprintf('k = %d, ak = %f + %fj\n', indices_nao_nulos(i), real(ak(indices_nao_nulos(i))), imag(ak(indices_nao_nulos(i))));
end

% (e) Gráfico com frequência normalizada
wn = (0:N-1) * (2*pi/N);
subplot(3,2,5); stem(wn, abs(ak), '^', 'filled'); xlabel('\omega_n'); ylabel('|a_k|'); title('Magnitude dos coeficientes de Fourier - Frequência Normalizada'); grid on;

% (f) FFT shift para centralizar k=0 no meio
af_shift = fftshift(ak);
k_shift = (-N/2:N/2-1);
subplot(3,2,6); stem(k_shift, abs(af_shift), 'filled'); xlabel('k'); ylabel('|a_k|'); title('Magnitude dos coeficientes de Fourier (FFT Shift)'); grid on;

% (g) Cálculo e plot da fase dos coeficientes de Fourier para y[n]
figure; stem(0:N-1, angle(bk)/pi, 'filled'); xlabel('k'); ylabel('Fase (radianos / pi)'); title('Fase dos coeficientes de Fourier de y[n]'); grid on;
