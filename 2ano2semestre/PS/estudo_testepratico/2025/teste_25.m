%% Q1) Mostra a parte real e imaginária de x[n]
clear; clc; close all;
N = 20; n = 0:N-1; % EDITAR
% Coeficientes de Fourier
a0 = 1; a1 = 2; am1 = -2; % EDITAR

% Reconstrução direta - vem da definição da série de Fourier (Aula 1)
x = a0 + a1*exp(1j*2*pi/20*n) + am1*exp(-1j*2*pi/20*n); % EDITAR

XR = real(x); XI = imag(x);

% Exibição
figure; subplot(2,1,1);
stem(n, XR, 'filled');
ylim([min(XR)-0.2, max(XR)+0.2]);
xlabel('n'); ylabel('Re\{x[n]\}'); title('Parte Real de x[n]');

subplot(2,1,2);
stem(n, XI, 'filled');
xlabel('n'); ylabel('Im\{x[n]\}'); title('Parte Imaginária de x[n]');
%% Q2) Dois harmónicos mais fortes
clear; clc; close all;
% Parâmetros
N = 100; % EDITAR
n = 0:N-1;
% Sinal: evitar tangente indefinida com modulação no domínio
x = abs(tan(mod(3*n, pi))) - abs(tan(mod(2*n, pi))); % EDITAR

% FFT e espectro de módulo
X = fft(x, N);
M = abs(X)/N;
M_single = M(1:N/2+1);
% Corrigir para duplicação correta da amplitude (exceto DC e Nyquist)
if mod(N,2)==0
    M_single(2:end-1) = 2*M_single(2:end-1);
else
    M_single(2:end) = 2*M_single(2:end);
end
% Índices de frequência
k = 0:N/2;
% Ordenar por magnitude para identificar os dois harmónicos mais fortes
[M_sorted, idx] = sort(M_single, 'descend');
% Selecionar os dois mais fortes (ignorando DC se necessário)
if idx(1) == 1
    strongest = idx(2:3);
else
    strongest = idx(1:2);
end

% Plots
figure;
stem(k, M_single, 'filled');
xlabel('k (índice de frequência)');
ylabel('|X[k]|');
title('Espectro de magnitude — harmónicos de x[n]');
grid on;

% Destaque dos dois harmónicos mais fortes
hold on;
stem(k(strongest), M_single(strongest), 'r', 'LineWidth', 1.5);
legend('Espectro','Dois harmónicos mais fortes');

%% Q3) Mostra os valores dos coeficientes, alterar Kmax consoante necessário
% Parâmetros do sinal
clear; clc; close all;
N = 500;                      % EDITAR - Período do sinal, x[n]
n_support = -5:5;             % EDITAR - Índices onde x[n] é não nulo
x_support = n_support.^2 + 1; % EDITAR - Definição do sinal em n
% Número de harmónicos a calcular
Kmax = 50; % EDITAR - Valor de k
ak = zeros(1, Kmax+1);        % Armazena a_k para k = 0 a Kmax

% Cálculo dos coeficientes de Fourier
for k = 0:Kmax
    soma = 0;
    for i = 1:length(n_support)
        n = mod(n_support(i), N);  % Ajusta n para [0,N-1]
        soma = soma + x_support(i) * exp(-1j*2*pi*k*n/N);
    end
    ak(k+1) = soma / N;
end

% Espectro de magnitude
figure;
stem(0:Kmax, abs(ak), 'filled');
xlabel('k'); ylabel('|a_k|');
title('Espectro de magnitude dos coeficientes de Fourier');
grid on;

% Identificação dos dois harmónicos mais fortes
[sorted_vals, idx] = sort(abs(ak), 'descend');
top2 = idx(1:2) - 1;  % Converter para valores reais de k
disp(['Dois harmónicos mais fortes: k = ', num2str(top2)]);
%% Q4) Para visualizar as magnitudes de |X[k]| e identificar os respetivos valores
clear; clc; close all;
a = 0.96;
Nsig = 31;
n = 0:Nsig-1;
x = a.^n;

Nfft = 1024;
X = fft(x, Nfft);
M = abs(X);

% Encontrar os dois maiores picos
[M_sorted, idx] = sort(M, 'descend');
k1 = idx(1) - 1;       % pico máximo
k2 = idx(2) - 1;       % segundo pico máximo
val1 = M_sorted(1);
val2 = M_sorted(2);

% Exibir resultados
fprintf('Maior pico:       k = %d, |X[k]| = %.4f\n', k1, val1);
fprintf('Segundo maior pico: k = %d, |X[k]| = %.4f, confirmar no gráfico (ATENÇÃO: Depende da onda)\n', k2, val2);

% (Opcional) Visualização parcial
figure;
stem(0:200, M(1:201), 'filled');
xlabel('k'); ylabel('|X[k]|');
title('Magnitude de X[k]');
grid on;
%% Q5) Devolve 
% o valor de um determinado |X[k]| = re + img
% módulo/valor absoluto
% angulo
clear; clc; close all;
% Parâmetros
Nfft = 512; % EDITAR
k = 10; % EDITAR
n0 = 4; % EDITAR

% Criar janela triangular x[n] centrada em n
x = [1:9, 8:-1:1]; % EDITAR
n = -8:8; % EDITAR

% Sinal deslocado: x[n - n0] ↔ inserir x em posição n0-8:n0+8
x_shifted = zeros(1, Nfft);
n_shifted = mod(n + n0, Nfft);  % deslocamento circular com wrap-around

% Preencher x_shifted com valores deslocados
x_shifted(n_shifted + 1) = x;

% Calcular DFT
X = fft(x_shifted, Nfft);

% Obter X[10]
X10 = X(k + 1);   % lembre-se que MATLAB é indexado a partir de 1

% Mostrar resultado
fprintf('Com n0 = %d:\n', n0);
fprintf('X[10] = %.4f + j%.4f\n', real(X10), imag(X10));
fprintf('|X[10]| = %.4f\n', abs(X10));
fprintf('Ângulo (radianos) = %.4f\n', angle(X10));

% (opcional) visualizar magnitude de X[k]
% figure;
% stem(0:50, abs(X(1:51)), 'filled');
% xlabel('k'); ylabel('|X[k]|');
% title('Magnitude parcial de X[k]');
%% Q6) Parte real, impar  e par de um x
clc; clear; close all;
% Definição do sinal
N = 32; % EDITAR
n = 0:N-1; % EDITAR
x = cos(n*2*pi/5) + sin(n*2*pi/17); % EDITAR

% Construção de x[-n mod N]
idx = mod(-n, N) + 1;  % Índices para x[-n mod N] % EDITAR
x_inv = x(idx);

% Parte par e ímpar
x_e = 0.5 * (x + x_inv);
x_o = 0.5 * (x - x_inv);

% Gráficos
figure;

subplot(3,1,1);
stem(n, x, 'k', 'filled');
title('x[n]');
xlabel('n'); ylabel('Amplitude');

subplot(3,1,2);
stem(n, x_e, 'b', 'filled');
title('Parte Par x_e[n]');
xlabel('n'); ylabel('Amplitude');

subplot(3,1,3);
stem(n, x_o, 'r', 'filled');
title('Parte Ímpar x_o[n]');
xlabel('n'); ylabel('Amplitude');
%% Q7)
clc; clear; close all;
% à mão:
% x[n] = cos(2*pi*784/400n) = cos(2pi*1.96*n)
% Sofre aliasing porque f_0 = 784Hz > fs=400Hz
% Portanto falias=|784-2*400| =16Hz
% fnorm=16/400=1/25
% Então x[n]=cos(2pi*1/25n)=cos(pi*(2/25)n-w) 
% Atenção: O sinal original tinha fase 0, mas foi refletido. 
% Esse reflexo inverte a fase constante, daí -w
%% Q8) Interpolação
clc; clear; close all;
% Sinal original
x = [2, -1, 1, 0, 1]; % EDITAR
% Fator de interpolação
L = 10; % EDITAR
% Ordem do filtro (N = 100 ⇒ comprimento = 101)
N = 100; % EDITAR
% Filtro FIR passa-baixo ideal com ganho 10
h = fir1(N, 1/L) * L;
% Interpolação (upfirdn cuida do zero-insertion + filtragem)
y = upfirdn(x, h, L, 1);
% Compensar atraso do filtro (linear phase, atraso = N/2)
delay = N/2;
% Amostra em n = 45 (corrigindo pelo atraso do filtro)
n = 45; % EDITAR
y45 = y(n + 1 + delay);  % +1 por indexing MATLAB, +delay por alinhamento
% Resultado
fprintf('Amostra interpolada em n = %d: %.4f\n', n, y45);
%% Q9) Módulo da resposta em frequência do sistema LTI gráfico
clc; clear; close all;
% Definição dos coeficientes
b = [2, -2, 3]; % numerador
a = [1, -4/5, 16/25, 3/25]; % denominador

% Avaliação em uma grade de frequências normalizadas [0, π]
omega = linspace(0, pi, 1024);
H = freqz(b, a, omega);

% Módulo
magH = abs(H);

% Plot
figure;
plot(omega/pi, magH, 'LineWidth', 1.5);
grid on;
xlabel('Frequência normalizada \omega / \pi');
ylabel('|H(e^{j\omega})|');
title('Módulo da resposta em frequência do sistema LTI');

%% Q10) Calcular um x[n] com base na transformada de Z
clc; clear; close all;
% Polos e resíduos
b = 1; % numerador
a = [1, -5/2, 1]; % EDITAR - e.i. denominador 1 - (5/2)z^(-1) + z^(-2)
[r, p, ~] = residuez(b, a);

% resíduos e polos
r1 = r(1); p1 = p(1);   % corresponde a termo 1
r2 = r(2); p2 = p(2);   % corresponde a termo 2

% Queremos x[-1]:
n = -1; % EDITAR
x_n = r1 * p1^n * (n < 0) + r2 * p2^n * (n >= 0);
disp(['x[-1] = ', num2str(x_n)]);

x_rational = sym(x_n);             % converte para fração simbólica
disp(['x[-1] = ', char(x_rational)]);
