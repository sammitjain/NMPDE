% Problem 4, Lab Sheet 1 (Pendulum System)
% Submitted by: Sammit Jain | 2014B4A3909G

function thetadot = prob4(t,theta)  %Function to initialize ODE
    g = 9.8;
    l = 0.5;
    thetadot(1) = theta(2);
    thetadot(2) = (g/l)*sin(theta(1));
    
    thetadot = thetadot';
end