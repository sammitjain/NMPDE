
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
%    Example of ADI Method for 2D heat equation                        %
%                                                                      %
%          u_t = u_{xx} + u_{yy} + f(x,t)                              %
%                                                                      %
%    Test problme:                                                     %
%      Exact solution: u(t,x,y) = exp(-t) sin(pi*x) sin(pi*y)          %
%      Source term:  f(t,x,y) = exp(-t) sin(pi*x) sin(pi*y) (2pi^2-1)  %
%                                                                      %
%    Files needed for the test:                                        %
%                                                                      %
%     adi.m:      This file, the main calling code.                    %
%     f.m:        The file defines the f(t,x,y)                        %
%     uexact.m:    The exact solution.                                 %
%                                                                      %
%     Results:         n              e            ratio               %
%                     10           0.0041                              %
%     t_final=0.5     20           0.0010           4.1                %
%                     40           2.5192e-04       3.97               %       
%                     80           6.3069e-05       3.9944             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   clear; close all;

   a = 0; b=1;  c=0; d=1; n = 40;  tfinal = 0.5;

   m = n;
   h = (b-a)/n;        dt=h;   
   h1 = h*h;
   x=a:h:b; y=c:h:d;

%-- Initial condition:

   t = 0;
   for i=1:m+1,
      for j=1:m+1,
         u1(i,j) = uexact(t,x(i),y(j));
      end
   end

%---------- Big loop for time t --------------------------------------

k_t = fix(tfinal/dt);

for k=1:k_t

t1 = t + dt; t2 = t + dt/2;

%--- sweep in x-direction --------------------------------------

for i=1:m+1,                              % Boundary condition.
  u2(i,1) = uexact(t2,x(i),y(1));
  u2(i,n+1) = uexact(t2,x(i),y(n+1));
  u2(1,i) = uexact(t2,x(1),y(i));
  u2(m+1,i) = uexact(t2,x(m+1),y(i));
end

for j = 2:n,                             % Look for fixed y(j) 

   A = sparse(m-1,m-1); b=zeros(m-1,1);
   for i=2:m,
      b(i-1) = (u1(i,j-1) -2*u1(i,j) + u1(i,j+1))/h1 + ...
		f2D(t2,x(i),y(j)) + 2*u1(i,j)/dt;
      if i == 2
        b(i-1) = b(i-1) + uexact(t2,x(i-1),y(j))/h1;
        A(i-1,i) = -1/h1;
      else
	if i==m
          b(i-1) = b(i-1) + uexact(t2,x(i+1),y(j))/h1;
          A(i-1,i-2) =  -1/h1;
	else
	   A(i-1,i) = -1/h1;
	   A(i-1,i-2) = -1/h1;
        end
      end

      A(i-1,i-1) = 2/dt + 2/h1;
    end

     ut = A\b;                          % Solve the diagonal matrix.
     for i=1:m-1,
	u2(i+1,j) = ut(i);
     end

 end                                    % Finish x-sweep.

%-------------- loop in y -direction --------------------------------

for i=1:m+1,                                % Boundary condition
  u1(i,1) = uexact(t1,x(i),y(1));
  u1(i,n+1) = uexact(t1,x(i),y(m+1));
  u1(1,i) = uexact(t1,x(1),y(i));
  u1(m+1,i) = uexact(t1,x(m+1),y(i));
end

for i = 2:m,

   A = sparse(m-1,m-1); b=zeros(m-1,1);
   for j=2:n,
      b(j-1) = (u2(i-1,j) -2*u2(i,j) + u2(i+1,j))/h1 + ...
                f2D(t2,x(i),y(j)) + 2*u2(i,j)/dt;
      if j == 2
        b(j-1) = b(j-1) + uexact(t1,x(i),y(j-1))/h1;
        A(j-1,j) = -1/h1;
      else
        if j==n
          b(j-1) = b(j-1) + uexact(t1,x(i),y(j+1))/h1;
          A(j-1,j-2) =  -1/h1;
        else
           A(j-1,j) = -1/h1;
           A(j-1,j-2) = -1/h1;
        end
      end

      A(j-1,j-1) = 2/dt + 2/h1;              % Solve the system
    end

     ut = A\b;
     for j=1:n-1,
        u1(i,j+1) = ut(j);
     end

 end                             % Finish y-sweep.

 t = t + dt;

%--- finish ADI method at this time level, go to the next time level.
      
end       %-- Finished with the loop in time

%----------- Data analysis ----------------------------------

  for i=1:m+1,
    for j=1:n+1,
       ue(i,j) = uexact(tfinal,x(i),y(j));
    end
  end

  e = max(max(abs(u1-ue)))        % The infinity error.

  mesh(u1);                       % Plot the computed solution.
  figure(2); mesh(u1-ue)          % Mesh plot of the error 