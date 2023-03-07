function unityfinder(n)
theta = 
for k = 0:n-1
    root = cos((2*pi*k)/n) + 1i * sin((2*pi*k)/n);
    disp("Root:" + root)
end
