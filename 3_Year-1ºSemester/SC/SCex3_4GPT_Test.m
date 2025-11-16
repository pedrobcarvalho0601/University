%% ==========================================================
% Exercício 4 – Critério de Routh e Simulação no MATLAB
% Sistema: G(s) = K / [ s (s^2 + s + 1) (s + 2) ]
% ==========================================================
clc; clear; close all;

%% 1. Definição da variável simbólica 's'
s = tf('s');

%% 2. Definição da função de transferência de malha aberta
%    G(s) = K / [ s (s^2 + s + 1) (s + 2) ]
%    Vamos deixar K como variável e testar valores específicos depois
K1 = 1;        % dentro da faixa de estabilidade (esperado: estável)
K2 = 3;        % fora da faixa (esperado: instável)

G1 = K1 / (s*(s^2 + s + 1)*(s + 2));
G2 = K2 / (s*(s^2 + s + 1)*(s + 2));

%% 3. Funções de transferência de malha fechada (feedback unitário)
T1 = feedback(G1, 1);    % K = 1 (estável)
T2 = feedback(G2, 1);    % K = 3 (instável)

%% 4. Exibir as funções de transferência resultantes
disp('--- Função de transferência em malha fechada ---')
T1, T2

%% 5. Mostrar polos para análise de estabilidade
disp('Polos para K = 1 (esperado estável):');
pole(T1)
disp('Polos para K = 3 (esperado instável):');
pole(T2)

%% 6. Resposta ao degrau para comparar estabilidade
figure('Name','Resposta ao Degrau','NumberTitle','off');
step(T1, 'b', T2, 'r--', 10);
legend('K=1 (estável)', 'K=3 (instável)', 'Location', 'best');
title('Resposta ao Degrau do Sistema de 4ª Ordem');
xlabel('Tempo (s)');
ylabel('Saída C(t)');
grid on;

%% 7. Root Locus (Lugar das Raízes)
% Mostra graficamente como os polos se movem com o ganho K
figure('Name','Root Locus','NumberTitle','off');
rlocus(1/(s*(s^2 + s + 1)*(s + 2)));
title('Lugar das Raízes do Sistema Aberto');
grid on;

%% 8. Comentário teórico (critério de Routh)
% Polinômio característico: s^4 + 3s^3 + 3s^2 + 2s + K = 0
% Tabela de Routh -> Condições de estabilidade:
%   1 > 0
%   3 > 0
%   7/3 > 0
%   (14 - 9K)/7 > 0   =>   K < 14/9 = 1.556
%   K > 0
%
% Faixa de estabilidade: 0 < K < 1.556

disp('----------------------------------------------')
disp('Faixa de estabilidade pelo critério de Routh:')
disp('         0 < K < 1.556')
disp('----------------------------------------------')

%% 9. Observações sobre a simulação:
% - Para K = 1: todos os polos têm parte real negativa (resposta estável).
% - Para K = 3: um polo cruza o eixo imaginário (instabilidade).
% - Root locus confirma o intervalo de estabilidade visualmente.
