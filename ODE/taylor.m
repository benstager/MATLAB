function e = taylor(xk, h, xend,y0)

x = xk;
y = y0;
n = (xend-x0)/h;
for i = 1:n
    y = 1 + x + (x)^2 + (x^3)/3;
    x = x+h;
end

    