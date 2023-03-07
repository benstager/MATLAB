function i = improvedPolygonal(f,x,y0)

y = y0 + x * f((x + x/2),(y0 + f(x,y0)*x/2));

y
