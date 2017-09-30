% Problem 6 Script, Lab Sheet 1 (Non-linear spring oscillator)
% Submitted by: Sammit Jain | 2014B4A3909G
t_0 = 0;
t_f = 100;

N = 600;

step_size = (t_f-t_0)/N;    %Initialize Step Size

tspan = t_0:step_size:t_f;  %Create spanning vector

Y_0 = -1;                     %Supply Initial values
Y_1 = 1;
[T,Y] = ode45('prob6',tspan,[Y_0 Y_1]);    %Return result

plot(T,Y(:,1))                   %Plot result
