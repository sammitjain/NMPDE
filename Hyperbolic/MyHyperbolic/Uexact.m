function esol = Uexact(t,x)

if abs(x-t)<1
    esol = 1-abs(x-t);
else
    esol = 0;
 end
