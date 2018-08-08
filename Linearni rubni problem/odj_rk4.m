function [ x,y ] = odj_rk4( f,a,b,y0,n )
h=(b-a)/n;
x(1)=a;
y(:,1)=y0;
for i=1:n
    x(i+1)=a+i*h;
    psi1=f(x(i),y(:,i));
    psi2=f(x(i)+0.5*h,y(:,i)+0.5*h*psi1);
    psi3=f(x(i)+0.5*h,y(:,i)+0.5*h*psi2);
    psi4=f(x(i+1),y(:,i)+h*psi3);
    y(:,i+1)=y(:,i)+h*(psi1/6+psi2/3+psi3/3+psi4/6);
end

end

