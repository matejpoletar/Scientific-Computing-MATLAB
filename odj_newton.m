%Newtonova metoda
function [ x_novi ] = odj_newton( f,df,z0,k )
x_stari=z0;
for i=1:k
   x_novi=x_stari-f(x_stari)/df(x_stari);
   x_stari=x_novi;
end
end