%Program:       Lab Sheet 1, Problem 3, Parabolic PDE using MOL
%Programmer:    Sammit Jain | 2014B4A30909G
function v = lab1_3(t,u)
global N h

dU = zeros(N-1,1);

dU(1) = (4/(pi^2))*(- 2*u(1) + u(2))/(h^2);
dU(N-1) = (4/(pi^2))*(u(N-2) - 2*u(N-1))/(h^2);

for j=2:N-2
    dU(j) = (4/(pi^2))*(u(j-1) - 2*u(j) + u(j+1))/(h^2);
end

v = dU;

