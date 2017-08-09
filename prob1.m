<<<<<<< HEAD
% Problem 1, Lab Sheet 1 (Tank height)
% Submitted by: Sammit Jain | 2014B4A3909G

function hdot = prob1(h,t)  %Function to initialize ODE
    alpha = 10 + 4*sin(t);  %Define other variables
    beta = 2;
    
    hdot = alpha - beta*sqrt(h);    %Return final ODE
=======
% Problem 1, Lab Sheet 1 (Tank height)
% Submitted by: Sammit Jain | 2014B4A3909G

function hdot = prob1(h,t)  %Function to initialize ODE
    alpha = 10 + 4*sin(t);  %Define other variables
    beta = 2;
    
    hdot = alpha - beta*sqrt(h);    %Return final ODE
>>>>>>> 6d6d32346b194d934b7a787c27bc0dbbb49240cc
end