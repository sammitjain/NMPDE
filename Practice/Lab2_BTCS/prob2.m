
x0 = 0;
xf = 1;

N = 100;

h = (xf-x0)/N;

t0 = 0;
M = 125;

mu = 2;
delt = mu*h^2;

for j = 1:N+1
    x(j) = (j-1)*h;
    U0(j) = x(j)*(1-x(j));
end

