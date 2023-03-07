function a = newton(x0,f,g);

x = x0;

while f(x) ~= 0
    x = x - f(x)/g(x);
end
x
    