
global N h 

format long;

x0 = 0;
xN = 2;

N = 50;

h = (xN-x0)/N;

for j = 1:N-1
    x(j) = j*h;
    u0(j) = sin(x(j)*pi/2);
end

t0 = 0;
tf = 1;

tspan = t0:0.1:tf;

[p,q] = size(tspan);

[t,y] = ode45('lab1_1',tspan,u0);

asol = y(q,:);
for i=1:length(tspan)
    for j = 1:N-1
        exact(i,j) = exp((t0+0.1*(i-1))*(-pi^2)/4)*sin(x(j)*pi/2);
    end
   
end
% plot(x,asol,'r+');
% hold on;
% plot(x,exact);
for j=1:length(tspan)
plot(x,exact(j,:));
hold on;
end