%%FFT - Fast Fourier Transform
function [ b ] = FFT( f,n )
for j=0:2^n-1
    b(j+1)=f(rho(j,n)+1);
end
for m=1:n
    for j=0:2^(m-1)-1
        e=exp(-2*pi*j*i/(2^m));
        for q=0:2^m:2^n-1
            u=b(q+j+1); 
            v=b(q+j+2^(m-1)+1)*e;
            b(q+j+1)=u+v;
            b(q+j+2^(m-1)+1)=u-v;
        end
    end
end


end

