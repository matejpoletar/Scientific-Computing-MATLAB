function [tt,y] = odj_rk23v(a,b,ya,tol)

    function [ dy ] = f( t,y )
    dy(1,1)=y(2);
    dy(2,1)=9.8-7*y(2)-1225*y(1);
    end

k = 0;
i = 1;
tt(1) = a;
t = a;
y(:,1) = ya;
wi = ya;
h=b-a;
lastit = 0;
while lastit == 0
    
    if t + h > b
            h = b - t;
            lastit = 1;
        end
    k1 = f(t,wi);
    k2 = f(t + 0.25 * h, wi + 0.25*h*k1);
    k3 = f(t + 27.0*h/40, wi + h*(-189.0*k1/800+729.0*k2/800));
    k4 = f(t + h, wi + h*(214.0*k1/891+k2/33+650.0*k3/891));
    w = wi + h * (214.0*k1/891+k2/33+650.0*k3/891);
    z = wi + h * (533.0*k1/2106+800.0*k3/1053-k4/78);
    e = norm(w-z,Inf);
    if e <= tol 
        t=t+h;
        h=0.9*h*(tol/e)^(1.0/3);
        i=i+1;
        tt(i)=t;
        wi=z;
        y(:,i)=z;
        k = 0;
    elseif k == 0 
        h=0.9*h*(tol/e)^(1.0/3);
        k=k+1;   
        lastit=0;
    else 
         h=0.9*h*(tol/e)^(1.0/3);
        lastit=0;
    end

end

figure
subplot(2,1,1)
plot (tt,y(1,:));
xlabel('$t$','interpreter','latex');
ylabel('$x$','interpreter','latex');
set(get(gca,'YLabel'),'Rotation',0)
subplot(2,1,2)
plot (tt,y(2,:));
xlabel('$t$','interpreter','latex');
ylabel('$\dot{x}$','interpreter','latex');
set(get(gca,'YLabel'),'Rotation',0)
end
     