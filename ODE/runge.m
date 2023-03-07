function i = runge(f,t0,y0,tend,h)

t = t0;
y = y0;
n = (tend-t0)/h;
disp("y(" + t0 + ")" + " = " + y0);
x(1) = y0;
g = @(t) exp(t);
for i = 1:n
    
    v1 = h*f(t,y);
    v2 = h*f(t + h/2,y + (1/2)*v1);
    v3 = h*f(t + h/2,y + (1/2)*v2);
    v4 = h*f(t + h, y + v3);
    y = y + (1/6)*(v1 + 2*v2 + 2*v3 + v4);
    t = t+h;
    x(i+1) = y;
    disp("y(" + t + ")" + " = " + y);
    disp("error: "+abs(g(t)-y));
end
t = linspace(0,tend,n+1);
plot(t,x);
hold on
fplot(@(t) exp(t),[0,tend]);
