close all;
clear all;

global dt

x0=0; xf=1;
y0=0; yf=1;
t0=0; tf=1;

N=100;
M=N;
h=(xf-x0)/N;
dt=0.01;

x=x0:h:xf;
y=y0:h:yf;

mu = dt/(2*h^2);

% initial condition

t=0;
u=zeros(N+1,M+1);
for i=1:N+1
    for j=1:M+1
        u(i,j)=sin(pi*x(i))*cos(pi*y(j));
    end
end


u_half=zeros(N+1,M+1);

a_half = zeros(N+1,N+1);
b_half= zeros(N+1,1);

a_one = zeros(M-1,M-1);
b_one= zeros(M-1,1);


for q=1:N
    a_half(q,q)=1+2*mu;
    a_half(q,q+1)=-1*mu;
    a_half(q+1,q)=-1*mu;
end
a_half(N+1,N+1)=1+2*mu;
a_half(1,2)=-2*mu;
a_half(N+1,N)=-2*mu;


for q=1:M-2
    a_one(q,q)=1+2*mu;
    a_one(q,q+1)=-1*mu;
    a_one(q+1,q)=-1*mu;
end
a_one(M-1,M-1)=1+2*mu;


t=dt;
for k=1:fix((tf-t0)/dt)
    
    %calculating u_half
    
    %j=1
    u_half(:,1)=exp(-t)*sin(pi*x);
    
    for j=2:M
        b_half(1)=u(1,j) + mu*(u(1,j-1)-2*u(1,j)+u(1,j+1)) - 2*mu*h*pi*exp(-t)*cos(pi*y(j)) + 0.5*(aszx(x(1),y(j),t-dt)+aszx(x(1),y(j),t));
        for i=2:N
            b_half(i)=u(i,j) + mu*(u(i,j-1)-2*u(i,j)+u(i,j+1)) + 0.5*(aszx(x(i),y(j),t-dt)+aszx(x(i),y(j),t));
        end
        b_half(N+1)=u(N+1,j) + mu*(u(N+1,j-1)-2*u(N+1,j)+u(N+1,j+1)) - 2*mu*h*pi*exp(-t)*cos(pi*y(j)) + 0.5*(aszx(x(N+1),y(j),t-dt)+aszx(x(N+1),y(j),t));
        
        u_half(:,j)=a_half\b_half;
    end
    
    %j=M+1
    u_half(:,M+1)=-exp(-t)*sin(pi*x);
    
    
    %calculating u
    u(:,1)=exp(-t)*sin(pi*x);
    u(:,M+1)=-exp(-t)*sin(pi*x);
    
    %i=1
    b_one(1)=u_half(1,2)+ mu*(-2*h*pi*exp(-t)*cos(pi*y(2))-2*u_half(1,2)+2*u_half(2,2)) + 0.5*(aszx(x(1),y(2),t-dt)+aszx(x(1),y(2),t)) + mu*u(1,1);
    for j=3:M-1
        b_one(j-1)=u_half(1,j)+ mu*(-2*h*pi*exp(-t)*cos(pi*y(j))-2*u_half(1,j)+2*u_half(2,j)) + 0.5*(aszx(x(1),y(j),t-dt)+aszx(x(1),y(j),t));
    end
    b_one(M-1)=u_half(1,M)+ mu*(-2*h*pi*exp(-t)*cos(pi*y(M))-2*u_half(1,M)+2*u_half(2,M)) + 0.5*(aszx(x(1),y(M),t-dt)+aszx(x(1),y(M),t)) + mu*u(1,M+1);
    u(1,2:M)=a_one\b_one;
    
    for i=2:N
        b_one(1)=u_half(i,2)+ mu*(u_half(i-1,2)-2*u_half(i,2)+u_half(i+1,2)) + 0.5*(aszx(x(i),y(2),t-dt)+aszx(x(i),y(2),t)) + mu*u(i,1);
        for j=3:M-1
            b_one(j-1)=u_half(i,j)+ mu*(u_half(i-1,j)-2*u_half(i,j)+u_half(i+1,j)) + 0.5*(aszx(x(i),y(j),t-dt)+aszx(x(i),y(j),t));
        end
        b_one(M-1)=u_half(i,M)+ mu*(u_half(i-1,M)-2*u_half(i,M)+u_half(i+1,M)) + 0.5*(aszx(x(i),y(M),t-dt)+aszx(x(i),y(M),t)) + mu*u(i,M+1);
        u(i,2:M)=a_one\b_one;
    end
    
    %i=N+1
    b_one(1)=u_half(N+1,2)+ mu*(2*u_half(N,2)-2*u_half(N+1,2)-2*h*pi*exp(-t)*cos(pi*y(2))) + 0.5*(aszx(x(N+1),y(2),t-dt)+aszx(x(N+1),y(2),t)) + mu*u(N+1,1);
    for j=3:M-1
        b_one(j-1)=u_half(N+1,j)+ mu*(2*u_half(N,j)-2*u_half(N+1,j)-2*h*pi*exp(-t)*cos(pi*y(j))) + 0.5*(aszx(x(N+1),y(j),t-dt)+aszx(x(N+1),y(j),t));
    end
    b_one(M-1)=u_half(N+1,M)+ mu*(2*u_half(N,M)-2*u_half(N+1,M)-2*h*pi*exp(-t)*cos(pi*y(M))) + 0.5*(aszx(x(N+1),y(M),t-dt)+aszx(x(N+1),y(M),t)) + mu*u(N+1,M+1);
    u(N+1,2:M)=a_one\b_one;
    
    
    t=t+dt;
end

t=t-dt;
uex=zeros(N+1,M+1);
for i=1:N+1
    for j=1:M+1
        uex(i,j)=exp(-t)*sin(pi*x(i))*cos(pi*y(j));
    end
end
 e = max(max(abs(u-uex)))
subplot (1,2,1)
mesh(u); title('approximate solution')
subplot(1,2,2)
mesh (uex); title('exact solution')