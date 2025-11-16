clc, clear;

v=24;
r=10;
c=2;
t=0;
q=0;

disp('tempo | carga do condesador');

while q<3
    q = c*v*(1-exp(-t/(r*c)));
    t=t+0.1;

    fprintf('%0.2f s --> %0.4f C \n',t, q);
end
