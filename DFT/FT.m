n=4;
x=pi/8*(0:15);
f=@(x) exp(-0.25*x^2);
F=arrayfun(f,x);
[ b ] = FFT( F,n );
[ A,B ] = trig_FFT(F,n);
y= @(x) fazni_pol(x,b);
Y=arrayfun(y,x);
plot (x,F,'b',x,Y/16,'ro')
e=norm(F-Y/16,inf)