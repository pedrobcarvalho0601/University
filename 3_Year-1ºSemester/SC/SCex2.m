%% Sistema de Suspensão Automotiva
% Parâmetros
m1 = 5;     % massa 1 (kg)
m2 = 15;    % massa 2 (kg)
k1 = 2;     % constante da mola do pneu (N/m)
k2 = 5;     % constante da mola da suspensão (N/m)
b  = 5;     % coeficiente de amortecimento (N·s/m)

%% Matrizes do espaço de estados
A = [  0       1       0       0;
      -(k1+k2)/m1  -b/m1   k2/m1   b/m1;
       0       0       0       1;
       k2/m2   b/m2  -k2/m2  -b/m2 ];

B = [ 0; k1/m1; 0; 0 ];          % Entrada: u(t)
C = [ 1 0 0 0; 0 0 1 0 ];        % Saídas: x (m1), y (m2)
D = [ 0; 0 ];

%% Sistema no MATLAB
sys = ss(A, B, C, D);

C2= [0 1 0 0; 0 0 0 1]; % teste de comparação

figure;
subplot(2,1,1)
step(A,B,C,D); grid on; % APP: Control System Toolbox
subplot(2,1,2); 
step(A,B,C2,D); grid on;