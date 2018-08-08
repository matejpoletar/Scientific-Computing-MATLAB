%Eulerova metoda za rjesavanje obicnih diferencijalnih jedn.
% Inicijalno - rubni problem
%       y' = f(x,y), x \in [a,b]
%       y(0) = y0
%INPUT: f- pointer na funkciju f
%       a, b - granice segmenta [a,b]
%       y0 - pocetni uvjet
%       n - broj to?aka diskretizacije
function [y]=odj_Euler(f,a,b,y0,n)
y(1)=y0;
h=(b-a)/n;
x(1)=a;
for i=1:n
    x(i+1)=a+i*h;
    y(i+1)=y(i)+h*f(x(i),y(i));
end
figure
plot (x,y,'*:');
hold on
fplot('exp(-x)*cos(5*x)',[0 3],'r-');
xlabel('x');
ylabel('y');
end

