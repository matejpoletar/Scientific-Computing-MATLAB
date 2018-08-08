function [ A,b ] = odj_kolokacija_kBs_Ab( t,x,L,f )

for i=1:11
    for j=1:11
        [y,dy,d2y]=deBoor_Cox(x(j),t,3,i+1);
        A(j,i)=L(x(j),y,dy,d2y);
    end
end
b=arrayfun(f,x);
end

