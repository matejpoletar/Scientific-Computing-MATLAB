%prvi puta pokrenuti ovako,a drugi puta dodati e
g=@(t) 0.2*cos(2*pi*20*t)+0.35*sin(2*pi*50*t)+0.3*sin(2*pi*70*t);
t=linspace(0,2,512);
e=0.5.*randn(1,512);
y=arrayfun(g,t);
b=FFT(y,9);
[A,B]=trig_FFT(y,9);
fi=(0:511)/2;
figure
plot(fi,abs(b))
xlabel('$\phi_k$','Interpreter','LaTex')
ylabel('$|\beta_k|$','Interpreter','LaTex')
figure
plot(fi(1:257),A)
xlabel('$\phi_k$','Interpreter','LaTex')
ylabel('$A_k$','Interpreter','LaTex')
figure
plot(fi(1:255),B)
xlabel('$\phi_k$','Interpreter','LaTex')
ylabel('$B_k$','Interpreter','LaTex')
