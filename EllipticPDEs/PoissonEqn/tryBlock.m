N0 = 4;
e = ones(N0^2,1);
e_I = ones(N0^2-N0,1);
A_T = spdiags([e -4*e e], -1:1, N0^2, N0^2);
A_I = spdiags(e_I,-N0,N0^2,N0^2);

A = A_T + A_I + A_I';
full(A)