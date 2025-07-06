%% Solução do Teste Prático de Processamento de Sinal de 2022.

%% Questão 1
N=32;
a0a4=[1,1,6,7,5]; % se o sinal é real e par, a[-1]=a[1]=1; a[-2]=a[2]=6; a[-3]=a[3]=7; a[-4]=a[4]=5
%a[-k]=a[N-k] => a[-1]=a[31],..., a[-4]=a[28]
%os 32 ak de um período em k=0:31
ak=[1,1,6,7,5,zeros(1,23),5,7,6,1]; length(ak) %32-(1+2*4)=23
x=ifft(ak)*N; %equação de síntese
stem(0:31,real(x)),grid %--->c)

%% Questão 2
% dados:
n=0:200;
x=cos(3*pi/21*n)+cos(5*pi/7*n+2);
%duas expressões racionais em w1=k*2*pi/N = 3*pi/21 e w2=r*2*pi/N = 5*pi/7.
%=> k=3*N/42, r=5*N/14
N=lcm(42,14) %42
%Logo k=3, r=15 --> d)

%% Questão 3
N=2048;
%x[n] tem de ser definido em n=0:2047.
%x[-n] tem de aparecer em x[N-n]
%São 31 uns e 2048-31 zeros
x=[ones(1,16),zeros(1,2017),ones(1,15)];
length(x)
%isCS(x) %função que averigua se x é CS.
% 	function yesno=isCS(x)
% 	%Verifica se x é CS: se x[0] é real e se x[n]=x*[N-n], n=1:N/2.
% 	if ~isvector(x), error('x tem de ser um vetor.'); end
% 	x=x(:)'; %vetor linha.
% 	xcs=[real(x(1)),1/2*(x(2:end)+conj(x(end:-1:2)))];
% 	yesno = all(x==xcs);
% 	end

ak=fft(x)/N; %eq. de análise
if max(abs(imag(ak)))<1e-10, ak=real(ak); end
ak(601) %-->a)

%% Questão 4
n=0:600; x=6:606;
length(x)
%N tem de ser (ou múltiplo de) N=95*2: w0=k*2*pi/190, k=3.
%Mas se fizermos:
N=95*2; k=3;
X=fft(x,N);
X(k+1) %--> não existe como opção. O que está errado? R: 190<601 (truncámos x[n])
N*4 %760 já serve.
N=760; k=12; %3*4
X=fft(x,N);
X(k+1) %--> a)
%Verificação com DTFT em w=3*pi/95:
w=3*pi/95;
XX = sum(x.*exp(-1j*w*n))

%% Questão 5
k=0:31; Z=cos(k*2*pi/15) +1j*cos(k*2*pi/7);
%X[k]=Z_CS[k]
Z_CS = [real(Z(1)),0.5*(Z(2:end)+conj(Z(end:-1:2)))];
x=ifft(Z_CS);
isreal(x)
stem(0:31,x),grid %--> a)

%% Questão 6
%Janela retangular centrada:
N1=21;
N=2*N1+1 %43
%tabelas ou slides: X = sin(N*w/2)./sin(w/2)
%onde X(exp(j0))=N --> c) ou e) ou f)
%Zeros quando sin(N*w/2)=0 e sin(w/2)~=0
%sin(N*w/2)=0 => N*w/2=k*pi ou w=k*2*pi/N
%1º zero quando w=2*pi/43 --> c)
%Verificação:
Nfft=1024; k=0:Nfft-1; w=k*2*pi/Nfft;
X=fft(ones(1,N),Nfft); %fase é diferente de zero ou pi, mas vamos ver apenas o módulo
plot(w/pi,abs(X))
X(1)
plot(k,abs(X))
%zero perto de k=24
24*2*pi/Nfft
2*pi/43
%Espetro real se:
N=64; %se N=43, x_til[n]=1
x=[ones(1,22),zeros(1,N-43),ones(1,21)];
X=fft(x);
max(abs(imag(X)))
plot(real(X))

%% Questão 7
%Em relação ao sinal centrado e com simetria par, x[n] está adiantado 3 amostras.
%Logo X(exp(jw)) = exp(+3j*w)*X0(exp(jw))
% A fase de X (fase=3*w) vai ter declive 3 -->c)
%Confirmação:
x0=[5,4,3,2,1,  1,2,3,4];
x =[2,1,  1,2,3,4,5,4,3];
X0=fft(x0)
X =fft(x )
max(abs(imag(X0))) %fase zero
k=0:8; w=k*2*pi/9;
plot(w/pi,angle(X)/pi),grid %para w/pi=0.1 a fase/pi é 0.3 --> declive 3
%conforme se sugere no enunciado:
Nfft=12;x=[2,1,zeros(1,Nfft-9),1,2,3,4,5,4,3]; length(x)
k=0:Nfft-1; w=k*2*pi/Nfft;
plot(w/pi,angle(fft(x))/pi),grid %para w/pi=0.1 a fase/pi é 0.3 --> declive 3

%% Questão 8
%sistema com:
num=[-2,-2,-8];
den=[1,3/5,16/23,-3/23];
%entrada periódica com DC=1 e w0=pi/4: x[n]=1+cos(pi/4*n)
%saída é y[n]=A+B*cos(pi/4*n+C)
%onde: A: ganho DC; B: ganho a pi/4; C: fase a pi/4
freqz(num,den) %faz 2 gráficos de módulo em dB e fase em graus.
%melhor:
H=freqz(num,den,[0,pi/4])
abs(H)
angle(H)

A=real(H(1))
B=abs(H(2))
C=angle(H(2)) %--f)
%alternativa:
[H,w]=freqz(num,den); %com 512 pontos em [0,pi[, mas faz FFT com Nfft=1024
%k=256 <--> pi/2
%k=128 <--> pi/4
H(1)
H(129)

%% Questão 9
clear
Y=[1:601,600:-1:2];
isreal(Y)
isCS(Y) %ver a função definida na questão 3
%A equação define y[n] = x[n+113].
%Então se atrasarmos y[n] de 113 amostras chegamos a x[n].
%Significa igualmente que y[n-113] = x[n]
%x[113]=y[0]
y=ifft(Y);
y(1) %--> b)

%% Questão 10
n=0:10000;fs=10000; x=sin(-3*pi/4*n-fs/2*cos(2*pi/fs*n));
N=200; Nhop=50;
xf=buffer(x,N,N-Nhop,'nodelay');
Nfft=512;
Xf=fft(xf,Nfft); %DFTs das colunas (tramas) de xf
Ntramas=size(xf,2);
k=0:Nfft/2; w=k*2*pi/Nfft;
imagesc(1:Ntramas,w/pi,db(Xf(1:Nfft/2+1,:))); axis xy
%--a)
%Nota: se fizermos:
k=0:Nfft; w=k*2*pi/Nfft;
imagesc(1:Ntramas,w/pi,db(Xf)); axis xy
%ou então:
k=-Nfft/2:Nfft/2-1; w=k*2*pi/Nfft;
imagesc(1:Ntramas,w/pi,db(fftshift(Xf,1))); axis xy
%vemos o sonograma "a dobrar", pois queremos ver apenas em [0,pi].
%Uma alternativa seria fazer:
k=0:Nfft; w=k*2*pi/Nfft;
imagesc(1:Ntramas,w/pi,db(Xf)); axis xy
axis([1,Ntramas,0,1])



