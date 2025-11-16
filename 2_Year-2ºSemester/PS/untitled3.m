L = 243;              % Largura do pulso
w = (3*pi)/11;        % Frequência

% Cálculo da DTFT para ω = 3π/11
X_w = sin((L/2) * w) / sin(w/2);

% Exibir o resultado
disp(['X(e^jw) = ', num2str(X_w)]);