% function v = f(x,t)
% v = exp(-t)*(x^2 - x + 2);
% end

function v = f(t,x)
v = exp(-t)*sin(pi*x)*(pi^2-1);
end