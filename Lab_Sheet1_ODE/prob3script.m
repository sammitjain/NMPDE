% Problem 3 Script, Lab Sheet 1 (Mass Spring System)
% Submitted by: Sammit Jain | 2014B4A3909G
t_0 = 0;
t_f = 10;

N = 100;

step_size = (t_f-t_0)/N;    %Initialize Step Size

tspan = t_0:step_size:t_f;  %Create spanning vector

y_0 = 3;                     %Supply Initial values
y_1 = 2;
[T,Y] = ode45('prob3',tspan,[y_0 y_1]);    %Return result

plot(T,Y(:,1));