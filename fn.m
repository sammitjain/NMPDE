function V = fn(t,x)

%V = exp(-t)*sin(pi*x)*(pi^2-exp(-t)*sin(pi*x));
V = exp(-t)*sin(pi*x)*(pi^2 - 2 + exp(-2*t)*sin(pi*x)^2);
end