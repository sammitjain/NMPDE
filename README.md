# NMPDE
Numerical Methods for Partial Differential Equations (MATH F422 - BITS Pilani)

How to find your way through this repo:
  1. Navigate to the folder corresponding to the problem you wish to solve.
  2. Clone the entire folder and not just the main .m files, as the associated functions should be present.
  3. Run the code normally in MATLAB, with the following tweaks:
    a. Change initial and exact functions according to requirement.
    b. Make sure you incorporate changes in the scheme due to different equations.
    c. Adjust the mu values based on steps in the dimensions (N and M respectively)
    
NMPDE is a course offered at BITS Pilani University, which deals with solving PDEs using numerical FD schemes, and studying their respective stabilities and orders of convergence.

Some of the schemes covered are: FTCS, BTCS, Crank Nicolson, ADI methods for 2D Parabolic PDEs, Theta-schemes, Thomas Algorithm, Jacobi Iterative method and Gauss Siedel Method

So far, we have covered Parabolic, Elliptic and Hyperbolic PDEs usually encountered in physics.

In the Hyperbolic PDEs, we encountered the 1D Wave equation and Burger's equation. They were solved using the following schemes:
  1. Lax Friedrichs Scheme
  2. Upwing Scheme
  3. Leap Frog Scheme
  4. Crank Nicolson Scheme
  5. Lax Wendroff Scheme
  6. Gudunov Scheme
  
The course is a practical introduction to modelling real life problems using partial differential equations and finding approximate solutions using robust, practical numerical methods. 
