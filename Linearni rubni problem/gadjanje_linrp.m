A=[1,0,-1;2,3,1;4,5,-2];
B=eye(3);
c=[3;-8;5];
a=0; b=2;
[x,y,s] = odj_gadjanje_linrp( @T,@g,a,b,A,B,c,100)
figure
plot (x,y(1,:),'b',x,y(2,:),'r',x,y(3,:),'g')
h=legend('$y_1(x)$','$y_2(x)$','$y_3(x)$','Location','southwest')
set(h,'Interpreter','latex')
xlabel('$x$','Interpreter','latex')
ylabel('$y_i(x)$','Interpreter','latex')
