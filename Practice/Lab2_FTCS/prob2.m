clear all;
close all;

x0 = 0;
xf = 1;

t = 0;

N = 100;
M = 250;
h = (xf-x0)/N;

mu = 0.45;

delt = mu*h^2;

for j=1:N+1
    x(j) = (j-1)*h;
    U0(j) = x(j)*(1-x(j));
end

for i=1:M
    uspl = U0(2) - 2*h*(exp(-t)-U0(1));
    U2(1) = mu*uspl + (1-2*mu)*U0(1) + mu*U0(2) + delt*exp(-t)*(2);
    
    for j = 2:N
        U2(j) = mu*U0(j-1) + (1-2*mu)*U0(j) + mu*U0(j+1) + delt*exp(-t)*(x(j)^2-x(j)+2);
    end
    uspl2 = -2*h*exp(-t) + U0(N);
    U2(N+1) = mu*U0(N) + (1-2*mu)*U0(N+1) + mu*uspl2 + delt*exp(-t)*(2);
    
    U0 = U2;
    t = t + delt;
    
end

for j = 1:N+1
Uex(j) = exp(-t)*x(j)*(1-x(j));
end

plot(x,Uex,'b');
hold on;
plot(x,U2,'r*');

err = abs(max(U2-Uex));


