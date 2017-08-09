% Problem 1, Lab Sheet 1 (Tank height)
% Submitted by: Sammit Jain | 2014B4A3909G

function hdot = prob1(h,t)  %Function to initialize ODE
    alpha = 10 + 4*sin(t);  %Define other variables
    beta = 2;
    
    hdot = alpha - beta*sqrt(h);    %Return final ODE
end