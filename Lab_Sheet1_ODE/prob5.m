% Problem 5, Lab Sheet 1 (Van der Pol's Equation)
% Submitted by: Sammit Jain | 2014B4A3909G

function vdot = prob5(t,v)  %Function to initialize ODE
    eps = 0.897;
    
    vdot(1) = v(2);
    vdot(2) = -eps*((v(1)^2)-1)*v(2) - v(1);
    
    vdot = vdot';
end