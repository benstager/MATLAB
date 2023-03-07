function JacobiAndSOR
% We want to solve -u'' = f(x)
% Find the optimal omega and determine how much it varies


rng(101);
nx = 1000; % amount of iterations
xbeg = -1; % starting point 
xend = 1; % ending point
ubeg = -1; % starting boundary
uend = 1; % ending boundary

method = 'NULL'; % case for switch
niter = 5000; % to be iterated through in loop
omega = 1.5; % omega
deltax = (xend-xbeg)/(nx-1); % change in x

x = (xbeg:deltax:xend)'; % transpose of x

f = @(x) cos(x); % function

u = rand(nx,1); % best first guess

A = zeros(nx,nx);
A(1,1) = -1;
for ix=2:nx-1
    A(ix,ix-1) = -1;
    A(ix,ix) = 2;
    A(ix,ix+1) = -1;
end

b = f(deltax^2);
b(1) = ubeg;
b(nx) = uend;
usolution = A\b;

plot(x,usolution,'r')
xlabel('x')
ylabel('solution')

switch method
    case 'Jacobi'
        unew = u;
        for iter=1:niter
            for ix=2:nx-1
                unew(ix) = .5*((ix-1) + u(ix+1)) + .5*b(ix);
            end
            u = omega*unew+(1-omega)*u;
        end
    case 'SOR'
        


end