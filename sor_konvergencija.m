%Konvergencija SOR metode
%input: A - matrica sustava

function sor_konvergencija (A)
for k=1:200
omega(k)=0.01*k;
D=diag(diag(A));
L=tril(A)-D;
U=triu(A)-D;
M=inv((1/omega(k))*D+L);
T=M*((1/omega(k)-1)*D-U);
ro(k)=max(abs(eig(T)));
end
plot (omega,ro);
xlabel ('omega');
ylabel('ro');
end