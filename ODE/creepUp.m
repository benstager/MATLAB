function a = creepUp(f,g,h,t,y0,x0,xend)

x = x0;
y = y0;
n = (xend - x0)/h;

for i = 1:n
    y = y + f(x,y)*t + g(x,y) *(t^2) + h(x,y)*(t^3);
    x = x+t;
    y
end
