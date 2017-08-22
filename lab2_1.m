function v = lab2_1(t,u)

global N h x

dU = zeros(N+1,1);
% U0 = (2*h*exp(-t) -u(2))/(2*h-1);
U0 = u(2) + 2*h*u(1) - 2*h*exp(-t);
% UN2 = -2*h*exp(-t) + u(N);
UN2 = -2*h*exp(-t) + u(N);
dU(1) = (U0-2*u(1) + u(2))/(h^2) + f(x(1),t);
dU(N+1) = (u(N)-2*u(N+1) + UN2)/(h^2) + f(x(N+1),t);

for j=2:N
    dU(j) = (u(j-1) - 2*u(j) + u(j+1))/(h^2) + f(x(j),t);
end

v = dU;
