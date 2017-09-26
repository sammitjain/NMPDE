%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                  Nonlinear Parabolic PDE                   %%%%
%%%%           u_t = u_xx-u+u^2+f(x,t), 0 < x < 1, t > 0        %%%%
%%%%  Initial condition: u(x, 0) = u0(x) = sin(pi*x)            %%%% 
%%%%  Boundary conditions: u(0,t) = 0, u(1,t) = 0.              %%%%
%%%%        Exact Solution: u(x,t) = exp(-t)*sin(pi*x).         %%%%
%%%%   Here f(x,t) = exp(-t)*sin(pi*x)*(pi^2-exp(-t)*sin(pi*x)) %%%%
%%%%            Course: MATH F422, Dr. P. Dhanumjaya            %%%%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

format long;
N = 100;
x0 = 0;
xN = 1;
tinit = 0;
tfinal = 1;

h = (xN-x0)/N;

delt = 0.0008;

for j = 1:N-1
    x(j) =j*h;
end

%%% Initial Condition
for j = 1:N-1
    U0(j) = sin(pi*x(j));
end

F = zeros(N-1,1);
A = zeros(N-1,N-1);
U1 = zeros(N-1,1);

mu = delt/(h^2);
nt = fix((tfinal-tinit)/delt);

%%%% Initial Guess %%%%%
U = ones(N-1,1);

%Starting the initial guess as all ones
%Given tolerance values

error = 1000.0;
Tol = 1.e-8;
k1 = 0;
t = 0;


    
%for j = 1:nt
    
 while error > Tol
           
%%%%% Nonlinear Equations %%%%%

F(1) = -(1+2*mu)*U(1)+mu*U(2)+delt*U(1)+U0(1)-delt*(U(1)^3)+delt*fn(t,x(1));

for i = 2:N-2
    %F(i) = -mu*U(i-1)+(1+2*mu+delt)*U(i)-mu*U(i+1)-delt*(U(i))^2-U0(i)-delt*fn(t,x(i));
    F(i) = mu*U(i-1)-(1+2*mu)*U(i)+mu*U(i+1)+delt*U(i)+U0(i)-delt*(U(i)^3)+delt*fn(t,x(i));
end

%F(N-1) = -mu*U(N-2)+(1+2*mu+delt)*U(N-1)-delt*(U(N-1))^2-U0(N-1)-delt*fn(t,x(N-1));
F(N-1) = mu*U(N-2)-(1+2*mu)*U(N-1)+delt*U(N-1)+U0(N-1)-delt*(U(N-1)^3)+delt*fn(t,x(N-1));
%%%%%% Jacobian Matrix %%%%%%%

for i = 1:N-1
    A(i,i) = -(1+2*mu)+delt-3*delt*(U(i))^2;
end

for i = 1:N-2
    A(i,i+1) = mu;
    A(i+1,i) = mu;
end

DELT = A\F;
U1 = U - DELT;
k1 = k1 + 1;
error = max(abs(U1-U));
U = U1;
U0 = U1;
t = t + delt;
end

%%%%%%%%%%%% Exact Solution %%%%%

for j = 1:N-1
    exact(j) = exp(-t)*sin(pi*x(j));
end

Err = max(abs(exact'-U1));

[U1, exact']

plot(x,exact,x,U1,'*')