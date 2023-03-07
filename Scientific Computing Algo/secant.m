function a = secant(f,a,b);

x0 = a;
x1 = b;
x2 = 0;
while f(x2) ~= 0
   x2 = x1 - f(x1)*((x1-x0)/(f(x1)-f(x0)));
   x0 = x1;
   x1 = x2;
end

x2
