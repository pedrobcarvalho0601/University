clc, clear;

val = input('indique o valor ');

while val<0 
   fprintf('ERRO! valor abaixo de zero ');
    val = input('indique o valor');
end


if rem(val,2)
fprintf('\n impar \n');
else 
    fprintf('\n par \n');
end


% if mod(val,2) ~= 0
% fprintf('\n impar \n');
% end


while val>0

    val = input('\n indique o valor ');

    if rem(val,2)
    fprintf('\n impar \n');
    else 
        fprintf('\n par \n');
    end

    if val<=0 
    fprintf('ERRO! valor abaixo de zero \n');
    val = input('indique o valor ');
    end
    
    % if rem(val,2) ~= 0
    % fprintf('\n impar \n');
    % end
end