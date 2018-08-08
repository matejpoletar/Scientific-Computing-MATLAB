%%Implementacija SOR metode za rješavanje linearnog sustava A x = b
%INPUT: A-matrica sustava
%       b-desna strana
%       x0-po?etna iteracija
%       tol-tolerancija (rezidual)
%       omega - parametar SOR metode

function [x,k,r]=sor(A,b,x0,tol,omega)
D=diag(diag(A));
L=tril(A)-D;
U=triu(A)-D;
M=inv((1/omega)*D+L);
T=M*((1/omega-1)*D-U);
c=M*b;
r(1)=norm(b-A*x0)/norm(b);
for k=1:100
   x=T*x0+c;
   r(k+1)=norm(b-A*x)/norm(b);
   if (r(k+1)<=tol) return;
   end
   x0=x;
end
end