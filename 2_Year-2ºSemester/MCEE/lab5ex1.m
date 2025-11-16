% Script atividade1a.m



% Solicita os dados ao usuário
Vm = input('Tensão (magnitude - V): ');
Va = input('Tensão (fase - graus): ');
Zm = input('Impedância (magnitude - Ohms): ');
Za = input('Impedância (fase - graus): ');

% Converte para forma complexa
V = Vm * exp(1j * deg2rad(Va));
Z = Zm * exp(1j * deg2rad(Za));

% Calcula a corrente
I = V / Z;

% Converte para magnitude e fase
Im = abs(I);
Ia = rad2deg(angle(I));

% Exibe o resultado
fprintf('O valor da corrente é %.2f < %.2f%c A\n', Im, Ia, 176);