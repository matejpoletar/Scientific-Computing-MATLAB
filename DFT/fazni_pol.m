%fazni polinom (Horner)
function [y]= fazni_pol(x,b)
eps=exp(i*x);
y=b(16);
for j=15:-1:1
    y=y*eps+b(j);
end