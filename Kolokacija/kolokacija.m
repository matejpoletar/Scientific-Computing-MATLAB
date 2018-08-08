t=linspace(0,1,11);
t=[0,0,0,t,1,1,1];
x=zeros(11,1);
for i=1:11
    x(i)=i/12;
end
[ A,b ] = odj_kolokacija_kBs_Ab( t,x,@L,@f );
alpha=A\b;
alpha=[0;alpha;0];
y=@(x) exp(-20)/(1+exp(-20))*exp(20*x)+exp(-20*x)/(1+exp(-20))-(cos(pi*x))^2; alpha=[0;-0.618385937035384;-0.849339156127858;-0.652794650418353;-0.332888359077159;-0.0676222989461080;0.0326379761552250;-0.0676222989461070;-0.332888359077159;-0.652794650418352;-0.849339156127859;-0.618385937035383;0];
v=@(x) deBoor(x,t,3,alpha);
figure
fplot(v,[0 0.99],'r*')
hold on
fplot(y, [0 1],'b')
legend('aproksimacija','egzaktno rješenje')
