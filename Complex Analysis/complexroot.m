function complexroot(z,n)
y = imag(z);
x = real(z);

theta = atan(y/x);
r = sqrt((y)^2+(x)^2);
for k = 0:n-1
    root = (r^n)*(cos((theta + 2*pi*k)/n) + i * sin((theta +2*pi*k)/n));
    disp("Root:" + root)
end
