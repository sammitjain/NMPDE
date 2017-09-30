% Problem 2, Lab Sheet 1 (Predator Prey Equation)
% Submitted by: Sammit Jain | 2014B4A3909G

function uvdot = prob2(t,uv)  %Function to initialize ODE
    uvdot(1) = (2-uv(2))*uv(1);
    uvdot(2) = (uv(1)-1)*uv(2);
    
    uvdot = uvdot';
end