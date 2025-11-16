clc, clear;
ano_nasc = input('Indique ano em que nasceu: ');
ano = input('Indique o ano presente: ');
nome = input('Indique o seu nome: ', 's');
altura = input('indique a sua altura em metros ');
peso = input('indique o seu peso ');

imc = peso/(altura^2);

% disp([nome ', se já celebrou o seu aniversário este ano,']);
% disp(['então já completou ', num2str(ano - ano_nasc), ' anos.']);

fprintf('%s, se já celebrou o seu aniversário este ano então já completou %d anos \n', nome, ano - ano_nasc);
fprintf('com um peso de %.1f e uma altura %.2f o seu IMC é %.1f \n', peso, altura, imc);

if(imc<18.5); fprintf('abixo do peso ideal'); end;
if(imc>18.5 && imc<25.0 ) fprintf('peso ideal'); end;
if(imc>25 && imc<30 ) fprintf('excesso de peso'); end;
if(imc>30 && imc<35 ) fprintf('obesidade I'); end;
if(imc>35 && imc<40 ) fprintf('obesidade II'); end;
if(imc>40 ) fprintf('obesidade III'); end;
