function [ y ] = rho(x,n)
s2=dec2bin(x);
s1(1:n-length(s2))='0';
y=bin2dec(fliplr(strcat(s1,s2)));
end

