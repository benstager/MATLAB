function a = fixedpoint(f,x0)


tol = 10^-2;
x = x0;
while abs(x-f(x)) > tol
    x = f(x);
end
x