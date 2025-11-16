close all;
clc;

% Leitura do arquivo de audio
fs=10000; n=0:10000;
x=-sin(pi/4*n+fs/3*cos(2*pi/fs*n-2));
%soundsc(x,fs);

% Definir parametros da analise
N = 180;       % Tamanho da trama (40ms)
L = 160;       % Avanço entre tramas (10ms)
NFFT = 1024;   % Tamanho da DFT

% Criar matriz de tramas manualmente
nTramas = floor((length(x) - N) / L) + 1;
xf = zeros(N, nTramas);

for i = 1:nTramas
    startIdx = (i - 1) * L + 1;
    xf(:, i) = x(startIdx:startIdx + N - 1);
end

% Calcular a FFT de cada trama
X = fft(xf, NFFT);
X_dB = 20 * log10(abs(X(1:NFFT/2, :))); % Apenas metade do espectro

% Construção dos eixos para o sonograma
k = 0:(NFFT/2 - 1); % Índices das frequências
m = 1:nTramas; % Índices das tramas
f = k / NFFT * fs; % Frequências em Hz

% Plot do sonograma
figure;
imagesc(m, f, X_dB);
axis xy;
xlabel('Índice da Trama (m)');
ylabel('Frequência (Hz)');
title('Sonograma do Sinal');
colorbar;

% d) Mostrar o espectro (em dB) da trama 100
trama_idx = 100;
figure;
plot(f, X_dB(:, trama_idx));
hold on;
line([1500 1500], ylim, 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1.5); % Linha em 1500 Hz
hold off;
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
title('Espectro da Trama 100');
grid on;

% % e) Ouvir o segmento de sinal das tramas 85 a 112
% start_sample = (85 - 1) * L + 1;
% end_sample = (112 - 1) * L + N;
% segmento = x(start_sample:end_sample);
% soundsc(segmento, fs);
% 
% % Exibir o segmento de sinal
% t_segmento = (start_sample:end_sample) / fs;
% figure;
% plot(t_segmento, segmento);
% xlabel('Tempo (s)');
% ylabel('Amplitude');
% title('Segmento de Sinal das Tramas 85 a 112');
% grid on;

 ini=85; fin=112;
 i=(ini-1)*L+1; j=(fin-1)*L+N;
 xx=x(i:j);
 soundsc(xx,fs)