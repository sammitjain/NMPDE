t_0 = 0;
t_f = 30;

N = 60;

step_size = (t_f-t_0)/N;    %Initialize Step Size

tspan = t_0:step_size:t_f;  %Create spanning vector

h0 = 1;                     %Supply Initial values

[T,H] = ode45('prob1',tspan,h0);    %Return result

plot(T,H)                   %Plot result