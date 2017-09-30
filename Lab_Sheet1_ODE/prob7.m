% Problem 7, Lab Sheet 1 (Lorenz system of equations)
% Submitted by: Sammit Jain | 2014B4A3909G

function xdot = prob7(t,x)  %Function to initialize ODE
    sigma = 10;
    r = 28;
    b = 8/3;
    xdot(1) = sigma*(x(2)-x(1));
    xdot(2) = ((1+r)-x(3))*x(1) - x(2);
    xdot(3) = x(1)*x(2) - b*x(3);
    xdot = xdot';
end