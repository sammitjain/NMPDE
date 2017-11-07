function u_0 = uinit(x)

if abs(x)<1
    u_0=1-abs(x);
else
    u_0 = 0;
end
