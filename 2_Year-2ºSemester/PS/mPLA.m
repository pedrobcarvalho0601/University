%% Declive da reta
clc, close
% Dados completos
d = [28, 23, 20, 17, 11, 8, 7, 6, 4, 3, 2, 1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 15, 17, 20, 24, 29];
Vef = [0.0034, 0.0060, 0.0088, 0.0136, 0.0393, 0.0748, 0.0939, 0.1183, 0.1842, 0.2232, 0.2603, 0.2879, 0.2981, 0.2879, 0.2603, 0.2232, 0.1842, 0.1485, 0.1183, 0.0939, 0.0748, 0.0483, 0.0322, 0.0187, 0.0136, 0.0088, 0.0053, 0.0031];
Vef = Vef * 1000;

% Selecionar dados apenas das posições entre 48 e 75
indices = (d >= 7) & (d <= 29);
d = d(indices);
Vef_filtrado = Vef(indices);

% Transformação logarítmica
log_d = log10(d);
log_Vef = log10(Vef_filtrado);

% Criar gráfico log-log
figure;
scatter(log_d, log_Vef, 'b', 'filled'); 
grid on;
xlabel('log(d)');
ylabel('log(V_{ef})');
title('Ajuste da reta');
axis([0.75 1.5 0 2.25]);

% Ajuste linear na região selecionada
p = polyfit(log_d, log_Vef, 1); % Ajuste de reta y = ax + b
declive = p(1); % Coeficiente angular da reta

% Plot da reta ajustada
hold on;
plot(log_d, polyval(p, log_d), 'r-', 'LineWidth', 2);
legend('Dados experimentais', 'Ajuste linear m=-2.6706', 'Location', 'northeast');

% Exibir declive
fprintf('O declive da reta ajustada é: %.4f\n', declive);