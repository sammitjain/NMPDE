%Lab Sheet 1: Problem 2
%Programmer: Sammit Jain | 2014B4A3909G

close all;
clear all;
global N h x

format long;

x0 = 0;
xN = 1;

N = 50;

h = (xN-x0)/N;

for j = 1:N+1
    x(j) = (j-1)*h;
    u0(j) = x(j)*(1-x(j));
end

t0 = 0;
tf = 1;

tspan = t0:0.1:tf;

[p,q] = size(tspan);

[t,y] = ode45('lab2_1',tspan,u0);

asol = y(q,:);
% for i=1:length(tspan)
    for j = 1:N+1
        exact(j) = exp(-tf)*x(j)*(1-x(j));
    end
   
% end
plot(x,asol,'r+');
hold on;
plot(x,exact,'b');
title('Approximate(+) and Exact Solutions ');
figure;
 surf(x,t,y);
title('Surf plot');
% for j=1:length(tspan)
% plot(x,exact(j,:));
% hold on;
% end

for i=1:length(tspan)
    for j = 1:N+1
        exact(i,j) = exp(-(t0+0.1*(i-1)))*x(j)*(1-x(j));
    end
   
end

figure;
for j=1:length(tspan)
plot(x,exact(j,:));
hold on;
end
title('Solution profiles');