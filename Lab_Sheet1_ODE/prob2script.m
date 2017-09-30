% Problem 2 Script, Lab Sheet 1 (Predator Prey Equation)
% Submitted by: Sammit Jain | 2014B4A3909G
t_0 = 0;
t_f = 10;

N = 100;

step_size = (t_f-t_0)/N;    %Initialize Step Size

tspan = t_0:step_size:t_f;  %Create spanning vector

u_0 = 3;                     %Supply Initial values
v_0 = 2;
[T,UV] = ode45('prob2',tspan,[u_0 v_0]);    %Return result

subplot(1,2,1);
plot(T,UV(:,1))                   %Plot result
hold on;
plot(T,UV(:,2))
title('u(t) vs t and v(t) vs t');

subplot(1,2,2);
plot(UV(:,1),UV(:,2))
title('u(t) vs v(t)');