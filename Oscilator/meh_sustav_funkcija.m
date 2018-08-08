function [ dy ] = meh_sustav_funkcija( t,y )
dy(1,1)=y(2);
dy(2,1)=9.8-7*y(2)-1225*y(1);
end

