% Problem 5 Script, Lab Sheet 1 (Van der Pol's Equation)
% Submitted by: Sammit Jain | 2014B4A3909G
t_0 = 2;
t_f = 20;

N = 100;

step_size = (t_f-t_0)/N;    %Initialize Step Size

tspan = t_0:step_size:t_f;  %Create spanning vector

V_0 = 1;                     %Supply Initial values
V_1 = 0;
[T,V] = ode45('prob5',tspan,[V_0 V_1]);    %Return result

plot(T,V(:,1))                   %Plot result
