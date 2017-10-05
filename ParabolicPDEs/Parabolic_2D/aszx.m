function z=aszx(x,y,t)

global dt

z=dt*0.5*(2*pi^2-1)*exp(-t)*sin(pi*x)*cos(pi*y);
end