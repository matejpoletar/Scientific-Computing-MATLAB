function [ x, y ] = odj_rk4( f,a,b,y0,n )
%RUNGE_KUTTA Summary of this function goes here
%   4-kora?na Runge-Kutta metoda za rjesavanje 
%   inicijalno - rubnog problema
%       y' = f(x,y), x \in [a,b]
%       y(0) = y0
% INPUT: f- pointer na funkciju f
%       a, b - granice segmenta [a,b]
%       y0 - pocetni uvjet
%       n - broj to?aka diskretizacije
y(1)=y0;
h=(b-a)/n;
x(1)=a;
for i=1:n
    x(i+1)=a+i*h;
    psi1=f(x(i),y(i));
    psi2=f(x(i)+0.5*h,y(i)+0.5*h*psi1);
    psi3=f(x(i)+0.5*h,y(i)+0.5*h*psi2);
    psi4=f(x(i+1),y(i)+h*psi3);
    y(i+1)=y(i)+h*(psi1/6+psi2/3+psi3/3+psi4/6);
end
max=norm(y-arrayfun(@(x) exp(-x)*cos(5*x),x),inf);
fprintf('maksimalna greška= %f', max);
figure
plot (x,y,'*:');
hold on
fplot('exp(-x)*cos(5*x)',[0 3],'r-');
xlabel('x');
ylabel('y');
legend('aproksimacija','egzaktno')
end