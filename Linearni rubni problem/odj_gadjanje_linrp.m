function [x,y,s] = odj_gadjanje_linrp( T,g,a,b,A,B,c,n )
   
    function [dy]=f(x,y)
        dy=T(x)*y;
    end

    function [dy]=F(x,y)
        dy=T(x)*y+g(x);
    end

I=eye(3);
for j=1:3
    y(:,1)=I(:,j);
    [x,y]=odj_rk4(@f,a,b,y(:,1),n);
    if (j==1) Y=y(:,n+1);
    else Y=[Y,y(:,n+1)];
    end
end

    y(:,1)=[0;0;0];
    [x,y]=odj_rk4(@F,a,b,y(:,1),n);
    s=-(A+B*Y)\(B*y(:,n+1)-c);
    y(:,1)=s;
    [x,y]=odj_rk4(@F,a,b,y(:,1),n);
end
