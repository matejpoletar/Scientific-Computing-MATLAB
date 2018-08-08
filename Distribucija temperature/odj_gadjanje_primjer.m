function [ x,y,s ] = odj_gadjanje_primjer(f,a,b,s0,n)

j=1;
s(j)=s0;
F1=1;
while abs(F1)>1e-7
y(:,1)=[s(j);0;s(j)];
[x,y]=odj_rk4(f,a,b,y(:,1),n);

delta_s=eps^0.5*s(j);
F1=y(1,n+1)-0;

y(:,1)=[s(j)+delta_s;0;s(j)+delta_s];
[x,y]=odj_rk4(f,a,b,y(:,1),n);

F2=y(1,n+1)-0;
dF=(F2-F1)/delta_s;
s(j+1)=s(j)-F1/dF;
j=j+1;
end
end
