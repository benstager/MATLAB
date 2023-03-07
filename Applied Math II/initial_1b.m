  function u0=initial_1b(t0)
%
% Function inital_1a sets the initial condition for the Boussinesq
% equation
%
% Parameters shared with other routines
  global xl xu x n ncall
%
% Spatial domain and initial condition
  xl=-15;
  xu= 25;
  n=101;
  dx=(xu-xl)/(n-1);
%
% ICs from analytical solution
  for i=1:n
    x(i)=xl+(i-1)*dx;
    u1(i)= ua_1a(x(i),t0);
    u2(i)=uat_1a(x(i),t0);
    u0(i)  =u1(i);
    u0(i+n)=u2(i);
end