clc, clear;

cor = input('indique a cor de uma camisa de um clube portugues ', 's');

switch  lower(cor) 
    case {'vermelho', 'encarnado'}
        fprintf('benfica');
    case {'verde', 'esverdeado'}
        fprintf('sporting');
    case {'azul', 'azulado'}
        fprintf('porto');
    otherwise
        fprintf('nao foi encontrado nenhum clube');

    end