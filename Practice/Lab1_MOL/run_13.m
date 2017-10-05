%Program:       Script to run Problem 3, Lab Sheet 1
%Programmer:    Sammit Jain | 2014B4A30909G
clear all;
global N h

x0 = 0;
xf = 4;

N = 50;

h = (xf-x0)/N;

t0 = 0;
tf = 1;

tspan = t0:0.1:tf;

[p,q] = size(tspan);

for j = 1:N-1
    x(j) = j*h;
    u0(j) = sin(pi*x(j)/4)*(1+2*cos(pi*x(j)/4));
end

[t,y] = ode45('lab1_3',tspan,u0);

asol = y(q,:);

for i = 1:length(tspan)
    for j = 1:N-1
        exact(j) = exp(-(t0 + 0.1*(i-1)))*sin(pi*x(j)/2) + exp(-(t0 + 0.1*(i-1))/4)*sin(pi*x(j)/4);
    end
end

plot(x,asol,'r*');
hold on;
plot(x,exact,'b');