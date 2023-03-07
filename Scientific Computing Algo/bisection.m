function a = bisection(f);

a = randi([-10,10],1,1);
b = randi([-10,10],1,1);

while f(a)*f(b) >= 0
    a = randi([-10,10],1,1);
    b = randi([-10,10],1,1);
end
tol = 10^-6;
c = (b+a)/2;

while abs(f(c)) > tol
    if sign(f(a)) == sign(f(c))
        a = c;
    else
        b = c;
    end
    c = (b+a)/2;

end
disp("Root: " + c)



    
    
