%%%%%%%%% The Upwind Scheme (FT-BS) %%%%%%%%%%%%%%%%%%%%

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
yp2 = zeros(N+1,1);
x = zeros(N+1,1);

for i = 1:N+1
    x(i) = xinit + (i-1)*h;
    yp(i) = uinit(x(i));    
    yq(i) = 0;
end

figure(1)
plot(x,yp)
title('Initial Profile')

%t = k;
yp2(1) = yp(1) - mu*yp(1);     
    for i = 2:N
        yp2(i) = yp(i) - mu*(yp(i) - yp(i-1));
    end 
    i = N+1;
    yp2(i) = yp(N+1) - mu*(yp(N+1)-yp(N));   
    %figure(2);
    %plot(x,yq);
    %pause(0.2)
    
    t = t + k;
    %yp = yp2;
    %yp2 = yq;
for j = 1:M
    yq(1) = yp(1) - mu*yp2(2);     
    for i = 2:N
        yq(i) = yp(i) - mu*(yp2(i+1) - yp2(i-1));
    end 
    i = N+1;
    yq(i) = yp(N+1) - mu*(-yp2(N));   
    figure(2);
    plot(x,yq);
    pause(0.2)
    
    t = t + k;
    yp = yp2;
    yp2 = yq;
end
     
Ue = zeros(N+1,1);
for i = 1:N+1
    Ue(i) = Uexact(t,x(i));
end
Err = max(abs(Ue-yq))
plot(x,yq,':',x,Ue)