function dy = richard(f,x,h)


D1=(f(x+h)-f(x-h))/(2*h);
D2=(f(x+h/2)-f(x-h/2))/h;

dy = (4*D2-D1)/3
end