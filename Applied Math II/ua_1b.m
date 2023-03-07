function uanal=ua_1b(x,t)
%
% Function uanal computes the exact solution of the Boussinesq equation
% for comparison with the numerical solution
%
% Model parameters
global c 
% Analytical solution
  xi=(1-c^2)^(0.5)/2*(x-c*t);
  uanal=(3/2)*(1-c^2)*(cosh(xi))^(-2);