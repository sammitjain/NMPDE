function v = cnscheme(N)
%clear all;
close all;
format long;

x0 = 0;
xN = 1;

t0 = 0;
tf = 1;

%N = 80;

h = (xN-x0)/N;

mu = 0.5;

k = mu*2*h^2;

M = (tf-t0)/k;
U0 =  zeros(N-1,1);
for j=1:N-1
    x(j) = j*h;
    U0(j) = sin(pi*x(j));
end

Uf = zeros(N-1,1);
A = zeros(N-1,N-1);
A(1,1) = 1+2*mu;
A(1,2) = -mu;
A(2,1) = -mu;

for j=2:N-2
    A(j,j) = 1+2*mu;
    A(j,j+1) = -mu;
    A(j+1,j) = -mu;
end

A(N-1,N-2) = -mu;
A(N-1,N-1) = 1+2*mu;

B = zeros(N-1,N-1);
B(1,1) = 1-2*mu;
B(1,2) = mu;
B(2,1) = mu;

for j=2:N-2
    B(j,j) = 1-2*mu;
    B(j,j+1) = mu;
    B(j+1,j) = mu;
end

B(N-1,N-2) = mu;
B(N-1,N-1) = 1-2*mu;

F = zeros(N-1,1);
t = t0;
f_cns = zeros(N-1,1);
for j = 1:M
    for i = 1:N-1
        f_cns = 0.5*(f(t,x(i))+f(t+k,x(i)));
        F(i) = k*f_cns;
        %B_cns = B*U0 + F;
    end
    B_cns = B*U0 + F;
    Uf = A\B_cns;
    U0 = Uf;
    t = t+k;
    
end

for i = 1:N-1
    exact(i) = exp(-t)*sin(pi*(x(i)));
end

error = max(abs(Uf - exact')); 
 
 
plot(x,Uf,'b'); 
hold on; 
plot(x,exact,'r+'); 
tit = sprintf('Error = %f',error); 
title(tit);
v = error;
end