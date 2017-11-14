%Program:       Lab Sheet 1, Problem 1, Parabolic PDE using FTCS
%Programmer:    Sammit Jain | 2014B4A30909G

clear all;
close all;

format long;

x0 = 0;
xf = 2;

t = 0;

N = 50;
M = 250;

h = (xf-x0)/N;

mu = 0.35;

delt = (h^2)*mu;

for j = 1:N+1
    x(j) = (j-1)*h;
    U0(j) = sin(pi*x(j)/2);
end

%U0(1) = 0;
%U0(N+1) = 0;

for j = 1:M
    %Uf(1) = (1-2*mu)*U0(1) + mu*U0(2);
    %Don't use expressions like the one above when doing zero
    %boundary conditions. Directly put 0.
    Uf(1) = 0;
    for i = 2:N
        Uf(i) = (1-2*mu)*U0(i) + mu*U0(i+1) + mu*U0(i-1);
    end
    
    %Uf(N+1) = (1-2*mu)*U0(N+1) + mu*U0(N);
    Uf(N+1) = 0;
    t = t+delt;
    U0 = Uf;
end

for j = 1:N+1
    exact(j) = exp((-pi*pi/4)*t)*sin(pi*x(j)/2);
end

error = max(abs(exact-Uf));

plot(x,exact,'b');
hold on;
plot(x,Uf,'r*');
str_title = fprintf('Error = %f',error);
title(str_title);