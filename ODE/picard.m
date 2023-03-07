function a = picard(f,x0)


tol = 10^-3;
x = x0;
while abs(f(x)-x) > tol
    x = f(x);
end
x