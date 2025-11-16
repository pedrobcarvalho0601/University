clc, clear, close all;

% Leitura do arquivo de audio
[x, fs] = audioread('dtmf024.wav');
soundsc(x,fs);

% Definir parametros da analise
N = 640;       % Tamanho da trama (40ms)
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

% Frequências DTMF
row_dtmf = [697, 770, 852, 941]; % Frequências das linhas
col_dtmf = [1209, 1336, 1447]; % Frequências das colunas

% Plot do sonograma
figure;
imagesc(m, f, X_dB);
axis xy;
xlabel('Índice da Trama (m)');
ylabel('Frequência (Hz)');
title('Sonograma do Sinal');
colorbar;
ylim([600 1500]); % Ajustar a janela do eixo Y

% Sobreposição das linhas DTMF
hold on;
for i = 1:4
    plot([1, nTramas], [row_dtmf(i), row_dtmf(i)], 'b', 'LineWidth', 1.5);
end
for i = 1:3
    plot([1, nTramas], [col_dtmf(i), col_dtmf(i)], 'r', 'LineWidth', 1.5);
end
hold off;
