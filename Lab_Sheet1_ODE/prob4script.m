% Problem 4 Script, Lab Sheet 1 (Pendulum System)
% Submitted by: Sammit Jain | 2014B4A3909G
t_0 = 0;
t_f = 5;

N = 40;

step_size = (t_f-t_0)/N;    %Initialize Step Size

tspan = t_0:step_size:t_f;  %Create spanning vector

theta_0 = pi/4;                     %Supply Initial values
theta_1 = 0;
[T,Theta] = ode45('prob4',tspan,[theta_0 theta_1]);    %Return result

plot(T,Theta(:,1));