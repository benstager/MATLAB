function ut = pde_1b(t,u)

% Numerical integration for quadratic Boussinesq eq

% Definition of global variables

global x1 xu n ncall

for i = 1:n
    u1(i) = u(i)
    u2(i) = u(1+n)
end

% n is discretization in x, 0 BC's
u1(1) = 0;
u2(n) = 0;

%u1xx

n1 = 1;
nu = 1;
u1x(1) = 0;
u1xx = dss044(x1,xu,n,u1,u1x,n1,nu);

u1xx(1) = 0;
u1xx(n) = 0;

u1xxx(1) = 0;
u1xxxx = dss044(x1,xu,n,u1xx,u1xxx,n1,nu);

u1s = u1.^2;
n1 = 1;
nu = 1;
u1sx(1) = 0;
u1sxx = dss044(x1,xu,n,u1s,u1sx,n1,nu);

u1t = u2;
u2t = u1xx - u1xxxx-u1sxx;


for i = 1:n
    ut(i) = u1t(i);
    ut(i+n) = u2t(i);
end
ut = ut';


end

