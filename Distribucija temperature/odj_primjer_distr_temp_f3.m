function [ F ] = odj_primjer_distr_temp_f3( x,y )
F(1,1)=y(2);
if x<=0.01
F(2,1)=0.4*exp(y(3))*(-1+0.3*x^2*exp(y(3)));
else
F(2,1)=-y(2)/x-0.8*exp(y(1));
end
F(3,1)=0;
end

