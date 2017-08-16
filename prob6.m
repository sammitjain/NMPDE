% Problem 6, Lab Sheet 1 (Non-linear spring oscillator)
% Submitted by: Sammit Jain | 2014B4A3909G

function ydot = prob6(t,y)  %Function to initialize ODE
    eps = 0.15;
    gamma = 0.3;
    omega = 1;
    ydot(1) = y(2);
    ydot(2) = gamma*cos(omega*t)-eps*(y(2)) - y(1)^3;
    
    ydot = ydot';
end