function [ T ] = T( x )
T(1,1)=x;
T(1,2)=0;
T(1,3)=-x^2;
T(2,1)=2*x^3-x;
T(2,2)=3*x^2-2*x+1;
T(2,3)=-4*x-2;
T(3,1)=-3*x^3+2;
T(3,2)=2*x^3+x^2-3*x;
T(3,3)=2*x;
end
