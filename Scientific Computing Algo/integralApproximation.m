function a = integralApproximation(f,x0,y0,h,xend)

y = y0;
x = x0;

while x <= xend
    const = @(x)f(x,y);
    y = y + integral(const,x-h,x);
    x = x+h;
    y
end

