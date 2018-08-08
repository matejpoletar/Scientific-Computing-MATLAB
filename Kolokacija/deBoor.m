function [ v ] = deBoor( x,t,k,A )

for J=k+1:k+11
    if t(J)<=x && x<t(J+1)
    j=J;    
    end
end

function [a]=alpha(x,t,l,j,A,K)
if l==0
    a=A(j);
else
    a=(x-t(j))/(t(j+K+1-l)-t(j))*alpha(x,t,l-1,j,A,K)+(t(j+K+1-l)-x)/(t(j+K+1-l)-t(j))*alpha(x,t,l-1,j-1,A,K);
end
end
v=alpha(x,t,k,j,A,k);
if x==1 
    v=1; 
end
end