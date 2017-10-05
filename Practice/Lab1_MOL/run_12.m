%Program:       Lab Sheet 1, Problem 2, MOL Parabolic PDE
%Programmer:    Sammit Jain | 2014B4A30909G

global N h

N = 50;

x0 = 0;
xf = 1;

h = (xf-x0)/N;

t0 = 0;
tf = 1;
tspan = t0:0.1:tf;

[p,q] = size(tspan);

for j = 1:N-1
    x(j) = j*h;
    u0(j) = 2*sin(2*pi*x(j));
end

[t,y] = ode45('lab1_2',tspan,u0);

for i=1:length(tspan)
    for j=1:N-1
        exact(j) = 2*sin(2*pi*x(j))*exp(-pi^2*(t0+(i-1)*0.1)/4);
    end
end

plot(x,exact,'b');
hold on;
plot(x,y(q,:),'r*');