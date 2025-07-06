
%% 1 coeficientes

N=8;
x=[0,-1,-5,0,3,-1,1,0];
ak=fft(x)/N
ak(5+1) % -0.3750 + 0.7500i
format rat
ak(5+1) % -3/8 + 3/4i
ak(end-2) % -3/8 + 3/4i

%% 2 TZ

clc; clear; 
a=999/1000;
format short
v=1/(1-a*exp(-7j*pi/13)) % 0.5004 - 0.4430i
N=26;
X=1./fft([1,-a],N);
X(7+1) % 0.5004 - 0.4430i

%% 3 DTFT 

x=[0,0,1,1,1,1,1,1,1];
Nfft=256; X=fft(x,Nfft); k= (0:Nfft-1); w=k*2*pi/Nfft;
n0=5;
Xr=exp(+1j*w*n0).*X;
isreal(Xr) %tem de ser real.
%Se não for, a parte imaginária deverá ter apenas erros de arredondamento:
max(abs(imag(Xr))) % 2.6201e-14. Logo:
Xr=real(Xr); plot(w/pi,Xr) % → c)
%ou:
u=@(n)(n>=0)*1; %degrau unitário
n=0:15; x=u(n-2)-u(n-9); stem(n,x) %sinal
w=(0:255)/256*2*pi;
Xr=sin(w*7/2)./sin(w/2); % find(isnan(Xr))→1
Xr(isnan(Xr))=7;
plot(w/pi,Xr);

%% 4 coeficientes DTFT

N=13; M=5; n=0:N-1;
x=0.54-0.46*cos(2*pi/(N-1)*n);
X=fft(x); a0=X(0+1)/M % 1.3120
sum(x)/M % 1.3120
format rat, a0 % 164/125 

%% 5 amostragem DTFT

x=[2,-4,-2, 5, 2, 2,-5,-1, 3]
X=fft(x,14);
X(6+1) % 4.8482 - 7.7876i → d)
%alternativa, pela definição de DTFT:
n=0:8; w=3*2*pi/7;
v = sum(x.*exp(-1j*w*n)) % 4.8482 - 7.7876i

%% 6 periodo da amostragem

n=0:100; x=2*cos(35*pi*n/50); plot(n,x), grid

%% 7 sinal y[n]

L=3; h=L*fir1(50,1/L); x=cos(2*pi/5*(0:19));
xe = kron(x,[1,0,0]); % o mesmo que: xe=upsample(x,3)
y = filter(h,1,xe);
plot(0:20*L-1,y) %ou simplesmente: plot(y) 

%% 8 funçao trasnferencia

B=[1,2,1]; A=[1,-13/12,3/8,-1/24];
format rat
[r,p]=residuez(B,A)
r =
 54
 -128
 75
p =
 1/2
 1/3
 1/4
%Os polos são distintos, logo:
n=0:20; %h[n]=0 para n<0 (sistema causal)
h=r(1)*p(1).^n+r(2)*p(2).^n+r(3)*p(3).^n; 

%% 9 resposta frequencia
A=[1,-1/6,1/9,2/9]; B=[1,2,3];
[H,w]=freqz(B,A);
plot(w/pi,abs(H))

%% 10 filtros

help fir1
h=fir1(100,1/5);
[H,w]=freqz(h,1);
plot(w/pi,db(H)),grid

plot(w/pi,abs(H)),grid