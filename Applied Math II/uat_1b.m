function uanal=uat_1b(x,t)
%
% Function uanal computes the time derivative of the exact solution
% of the Boussinesq equation
%
% Model parameters
global c 
% Analytical solution derivative
  xi=(1-c^2)^(0.5)/2*(x-c*t);
  uanal=(3/2)*c*(1-c^2)^(3/2)*sinh(xi)*(cosh(xi))^(-3);