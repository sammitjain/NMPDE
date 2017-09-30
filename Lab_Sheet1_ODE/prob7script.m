% Problem 7 Script, Lab Sheet 1 (Lorenz System of Equations)
% Submitted by: Sammit Jain | 2014B4A3909G
t_0 = 0;
t_f = 50;

N = 400;

step_size = (t_f-t_0)/N;    %Initialize Step Size

tspan = t_0:step_size:t_f;  %Create spanning vector

X_1 = -10;                     %Supply Initial values
X_2 = 10;
X_3 = 25;
[T,X] = ode45('prob7',tspan,[X_1 X_2 X_3]);    %Return result

% subplot(1,3,1);
% plot(T,X(:,1));                   %Plot result
% hold on;
% subplot(1,3,2);
% plot(T,X(:,2));
% hold on;
% subplot(1,3,3);
% plot(T,X(:,3));
plot3(X(:,1), X(:,2), X(:,3));