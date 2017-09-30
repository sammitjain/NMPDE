% Problem 3, Lab Sheet 1 (Mass Spring System)
% Submitted by: Sammit Jain | 2014B4A3909G

function ydot = prob3(t,y)  %Function to initialize ODE
    omega = 2;
    c = 5;
    g = sin(t);
    ydot(1) = y(2);
    ydot(2) = g-c*y(2)-omega*omega*y(1);
    
    ydot = ydot';
end