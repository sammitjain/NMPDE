%%%%%%%%% Lax-Friedrichs Scheme %%%%%%%%%%%%%%%%%%%%

clear all;
close all;
xinit = -2;
xfinal = 3;
tfinal = 1;
N = 200;
h = (xfinal-xinit)/N;
k = 0.8*h;
mu = k/h;
t = 0;
M = fix(tfinal/k);
yp = zeros(N+1,1);
yq = zeros(N+1,1);
x = zeros(N+1,1);

for i = 1:N+1
    x(i) = xinit + (i-1)*h;
    yp(i) = uinit(x(i));
    yq(i) = 0;
end

figure(1)
plot(x,yp)
title('Initial Profile')

t = 0;
for j = 1:M
    yq(1) = 0.5*(yp(2)) - mu*(yp(2))*0.5; 
    
    for i = 2:N
        yq(i) = 0.5*(yp(i+1)+yp(i-1)) - mu*(yp(i+1) - yp(i-1))*0.5;
    end
    
    i = N+1;
    yq(i) = 0.5*(yp(N)+2*(x(i)-2)) - mu*(2*(x(i)-2)-yp(N))*0.5;
    
    figure(2);
    plot(x,yq);
    pause(0.3)
    
    t = t + k;
    yp = yq;
end
     
Ue = zeros(N+1,1);
for i = 1:N+1
    Ue(i) = Uexact(t,x(i));
end
Err = max(abs(Ue-yq))
plot(x,yq,'*',x,Ue)
