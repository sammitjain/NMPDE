%Program:       Script for Lab Sheet 1, Problem 4 - Parabolic PDE MOL
%Programmer:    Sammit Jain | 2014B4A30909G

clear all;
global N h

N = 50;

x0 = 0;
xf = 1;

h = (xf-x0)/N;
t0 = 0;
tf = 1;
tspan = t0:0.1:tf;

[p,q] = size(tspan);
 l = length(tspan);
 
%Setting the initial conditions for MOL
for j = 1:N-1
    x(j) = j*h;
    u0(j) = cos(pi*(x(j)-0.5));
end

[t,y] = ode45('lab1_4',tspan,u0);

for i = 1:l
    for j=1:N-1
        exact(j) = exp(-(t0+0.1*(i-1)))*cos(pi*(x(j)-0.5));
    end
end

plot(x,exact,'b');
hold on;
plot(x,y(q,:),'r*');