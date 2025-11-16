clc, clear

f = @(x) cos(x)*cosh(x);

function r = NewtonRaphson(f, x1, tol, N)

 if nargin < 4 || isempty(N), N = 20; end
 if nargin < 3 || isempty(tol), tol = 1e-4; end

 % Converte a função anónima em expressão simbólica, calcula a derivada, e
 % converte o resultado numa nova função anónima
 y = sym(f);
 fp = matlabFunction(diff(y));

 for n = 1:N
 if fp(x1) == 0
 error('x1 é mínimo/máximo local');
 end

 x2 = x1 - f(x1)/fp(x1); % Calcula nova aproximação à solução de f(x)

 if abs(x2 - x1) < tol % Solução encontrada satisfaz tolerância?
 r = x2; % Sim, x2 é a solução aproximada.
 return
 else
 x1 = x2; % Não, Atualiza x1 para a próxima iteração.
 end
 end


 end