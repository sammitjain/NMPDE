%NOTE: Remember to initialize the function f properly
clear all;
close all;

format long;

%Setting up the limits
x0 = 0;
xN = 1;
t = 0;
%Setting up the resolution in time and space
N = 50;

M = 250;

h = (xN-x0)/N;
%Fixing mu according to the l infinity stability criterion
mu = 0.45;

k = mu*h^2;
x = zeros(1,N+1);
Uo = zeros(1,N+1);

%initializing the value of the function
for j=1:N+1
    x(j) = (j-1)*h;
    Uo(j) = cos(pi*x(j));
end

Uf = zeros(1,N+1);

for j=1:M
    Uf(1) = (1-2*mu)*Uo(1) + mu*(2*Uo(2)) + k*f(x(1),t);
    
    for i=2:N
        Uf(i) = (1-2*mu)*Uo(i) + mu*(Uo(i-1)+Uo(i+1)) + k*f(x(i),t);
    end
    
    Uf(N+1) = (1-2*mu)*Uo(N+1) + mu*(2*Uo(N)) + k*f(x(N+1),t);
    
    t = t+k;
    Uo = Uf;
end

%This will give us the solution at tF

%Setting up the exact solution now:
exact = zeros(1,N+1);
for j = 1:N+1
    exact(j) = exp(-t)*cos(pi*x(j));
end

error = max(abs(exact - Uf));

plot(x,exact,'b');
hold on;
plot(x,Uf,'r+');
disp(error);