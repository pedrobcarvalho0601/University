% Dados fornecidos
B = [0.0001, 0.0003, 0.0005, 0.0006, 0.0009, 0.0012, 0.0016, 0.0030, 0.0060, 0.0374];
tan_theta = [0, 0.1763, 0.3639, 0.5774, 0.8391, 1.1918, 1.7321, 2.7475, 5.6713];

% Remover valores inválidos (tan_theta = 0)
valid_idx = tan_theta ~= 0;
B_valid = B(valid_idx);
tan_theta_valid = tan_theta(valid_idx);

% Ajuste linear forçando a origem (tan(theta) = b * B)
b = sum(tan_theta_valid .* B_valid) / sum(B_valid .^ 2);
a = 0; % Garantindo que a reta passe pela origem

% Cálculo da incerteza em b
N = length(B_valid);  % Número de pontos válidos
sigma_b = sqrt(sum((tan_theta_valid - b * B_valid).^2) / ((N - 1) * sum(B_valid.^2)));

% Determinação de BH e sua incerteza
BH = 1 / b;
sigma_BH = sigma_b / b^2;

% Criar valores para a reta ajustada
B_fit = linspace(0, max(B_valid), 100); % Começar de zero
tan_theta_fit = a + b * B_fit; % Reta ajustada

% Criando o gráfico
figure;
plot(B_valid, tan_theta_valid, 'bo', 'MarkerSize', 6, 'LineWidth', 2); % Pontos experimentais
hold on;
plot(B_fit, tan_theta_fit, 'r-', 'LineWidth', 2); % Reta ajustada

% Personalização do gráfico
xlabel('Campo Magnético B (Tesla)');
ylabel('tan(\theta)');
title('Ajuste linear de tan(\theta) = b * B');
grid on;
legend('Dados experimentais', 'Ajuste linear', 'Location', 'NorthWest');
hold off;

% Ajustando a escala
xlim([0, max(B_valid) * 1.1]);
ylim([0, max(tan_theta_valid) * 1.1]);

% Ajustando o tamanho da janela
set(gcf, 'Position', [100, 100, 600, 400]);

% Exibir coeficientes ajustados
fprintf('Coeficiente ajustado: b = %.5f\n', b);
fprintf('Incerteza em b: σ_b = %.5f\n', sigma_b);
fprintf('Valor de BH: BH = %.5f ± %.5f\n', BH, sigma_BH);
fprintf('Equação ajustada: tan(θ) = %.5f * B\n', b);
