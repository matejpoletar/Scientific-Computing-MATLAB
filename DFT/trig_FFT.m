function [ A,B ] = trig_FFT(F,n)
b=FFT(F,n);
M=2^n/2;
A0=2*b(1);
for j=1:M-1
   A(j)=b(j+1)+b(2^n+1-j);
   B(j)=j*(b(j+1)-b(2^n+1-j));
end
AM=2*b(M+1);
A=[A0,A,AM];
end

