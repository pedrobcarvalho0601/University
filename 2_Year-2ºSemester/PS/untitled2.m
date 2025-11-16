% Dados fornecidos
B = [0.0001, 0.0003, 0.0005, 0.0006, 0.0009, 0.0012, 0.0016, 0.0030, 0.0060, 0.0374];
tan_theta = [0, 0.174533, 0.359066, 0.523599, 0.698132, 0.872665, 1.047200, 1.221700, 1.396300, 1.570800];


% Remover valores inválidos (tan_theta = 0)
valid_idx = tan_theta ~= 0;
B_valid = B(valid_idx);
tan_theta_valid = tan_theta(valid_idx);

% Criando o gráfico
figure;

% Plotando os pontos experimentais unidos por linhas
plot(B_valid, tan_theta_valid, '-o', 'MarkerSize', 6, 'LineWidth', 2); 

% Personalização do gráfico
xlabel('Campo Magnético B (Tesla)');
ylabel('(\theta)');
title('Gráfico de (\theta) em função de B (Pontos conectados)');
grid on;
xlim([0, max(B_valid) * 1.1]);
ylim([0, max(tan_theta_valid) * 1.1]);

% Ajustando o tamanho da janela
set(gcf, 'Position', [100, 100, 600, 400]);
