close all;
%clear all;

%Setting up the domain
r1 = 0;
r2 = 1;

th1 = 0;
th2 = 2*pi;

%Setting the step size
dr = 0.01;
dth = 2*pi/90;

dr2 = dr*dr;
dth2 = dth*dth;

r = r1+dr:dr:r2;
th = th1:dth:th2;

N = size(r,2) - 1;
M = size(th,2) - 1;

u2 = zeros(N+1,M+1);
usol = zeros(N+1,M+1);

for i = 1:M+1
    u2(N+1,i) = cos(2*th(i));
end


%Plotting mesh with BCs
[R,TH] = ndgrid(r,th);
[X,Y] = pol2cart(TH,R);
subplot(1,3,1);
mesh(X,Y,u2);
title('Domain with the Boundary condition cos(2*theta)');

for i=1:N+1
    u2(i,1) = r(i)*r(i);
    u2(i,M+1) = r(i)*r(i);
end

%To start the iteration loop
err = 1000;

%Number of iterations
k=0;
u = u2;

tol = 1e-6;
while err > tol
    for i = 2:N
        for j = 2:M
            rip = (r(i)+r(i+1))/2;
            rim = (r(i)+r(i-1))/2;
            term1 = (-1/(r(i)*dr2))*(rim*u(i-1,j) + rip*u(i+1,j));
            term2 = (-1/(r(i)*r(i)*dth2))*(u(i,j-1)+u(i,j+1));
            term3 = (-1/(r(i)*dr2))*(rip+rim) - 2/(r(i)*r(i)*dth2);
            
            u(i,j) = (term1+term2)/term3;
            
        end
    end
    err = max(max(abs(u-u2)));
    u2 = u;
    k = k+1;
end

%Printing the exact solution profile
subplot(1,3,2);
mesh(X,Y,u2);
title('Approximate Solution');
for i = 1:N+1
    for j = 1:M+1
        usol(i,j) = r(i)*r(i)*cos(2*th(j));
    end
end

subplot(1,3,3);
mesh(X,Y,usol);
title('Exact solution');

error = max(max(abs(u2-usol)));