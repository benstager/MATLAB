function y = improvedEuler(f,x0,y0,xend,h)

x = x0;
y = y0;
n = (xend-x0)/h
for i = 1:n
    y = y + h * f(x + h/2, y + f(x,y)*(h/2));
    x = x+h;
    x
    y
end
end
