%Note: Remember to initialize the function f properly
clear all;
close all;
format long;

%Setting up the limits

x0 = 0;
xN = 1;

t0 = 0;
tf = 1;

N = 80;

h = (xN-x0)/N;

mu = 0.5;

%Setting up the time interval
k = mu*h^2;
M = (tf-t0)/k;

%Setting up the initial values from the given diferential equation

for j=1:N+1
    x(j) = (j-1)*h;
    U0(j) = cos(pi*x(j));
end

Uf = zeros(N+1,1);
A = zeros(N+1,N+1);
b = zeros(N+1,1);

A(1,1) = 1+2*mu;
A(1,2) = -2*mu;
A(2,1) = -mu;

for j = 2:N
    A(j,j) = 1+2*mu;
    A(j,j+1) = -mu;
    A(j+1,j) = -mu;
end

A(N+1,N) = -2*mu;
A(N+1,N+1) = 1+2*mu;

t = t0;

for j = 1:M
    for i = 1:N+1
        b(i) = U0(i) + k*f(x(i),t);
    end
    Uf = A\b;
    U0 = Uf;
    t = t+k;
end

%This will give us the solution in the variable Uf at t = tf;

%Now we'll set up the exact solution

for i = 1:N+1
    exact(i) = exp(-t)*cos(pi*x(i));
end

error = max(abs(Uf - exact'));

plot(x,Uf,'b');
hold on;
plot(x,exact,'r+');
tit = sprintf('Error = %f',error);
title(tit);
