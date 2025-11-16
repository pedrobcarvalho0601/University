clear, clc;

A = rand(5,200);

A(A<0.3)=0;
A(A>0.7)=1;

disp(A);

