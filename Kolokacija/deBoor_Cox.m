function [y,dy,d2y]=deBoor_Cox(x,t,k,i)

function [y]=deBoorCox(x,t,k,i)
if k==0
if ((x >= t(i))&&(x < t(i+1)))
    y=1;
else
    y=0;
end

else
    y=0;
    if (t(i)<t(i+1+k))
        if (t(i+k)~=t(i))
        y=y+(x-t(i))/(t(i+k)-t(i))*deBoorCox(x,t,k-1,i);
        end
        if (t(i+k+1)~=t(i+1))
        y=y+(t(i+k+1)-x)/(t(i+k+1)-t(i+1))*deBoorCox(x,t,k-1,i+1);
        end
    else
    y=0;
    end
end
end

y=deBoorCox(x,t,k,i);
dy=0;
if (t(k+i)-t(i))~=0
    dy=dy + k*deBoorCox(x,t,k-1,i)/(t(k+i)-t(i));
end
if (t(k+i+1)-t(i+1))~=0
    dy=dy - k*deBoorCox(x,t,k-1,i+1)/(t(k+i+1)-t(i+1));
end

dy1=0;
if (t(k+i-1)-t(i))~=0
dy1=dy+(k-1)*deBoorCox(x,t,k-2,i)/(t(k+i-1)-t(i)) ;
end
if (t(k+i)-t(i+1))~=0
dy1=dy1 - (k-1)*deBoorCox(x,t,k-2,i+1)/(t(k+i)-t(i+1));
end

dy2=0;
if(t(k+i)-t(i+1))~=0
dy2=dy2+(k-1)*deBoorCox(x,t,k-2,i+1)/(t(k+i)-t(i+1));  
end
if(t(k+i+1)-t(i+2))~=0
dy2=dy2-(k-1)*deBoorCox(x,t,k-2,i+2)/(t(k+i+1)-t(i+2));
end

d2y=0;
if (t(k+i)-t(i))~=0
d2y=d2y+k*dy1/(t(k+i)-t(i));
end
if (t(k+i+1)-t(i+1))~=0
d2y=d2y-k*dy2/(t(k+i+1)-t(i+1));
end
end