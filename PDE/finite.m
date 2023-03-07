
% First code for h = 1/8
function i = finite()

n = 7;
h =  1/8;
f = @(x) -2*(-1*x^3-9*x^2+3*x+3)/((x^2+1)^3);

A = zeros(n+1, n+1);
A(1,1) = 1;
A(n+1, n+1) = 1;
for i = 2:n
    A(i-1, i) = 1;
    A(i, i) = -2;
    A(i, i-1) = 1;
end

A(n,n+1) = 1;
A(1,2) = 0;
disp(A)

b = zeros(n+1);
b(1) = 3;
x = 0;
for i = 2:n
    x = x+h;
    b(i) = h^2*f(x);
end
b(n+1) = 2;
disp(b)


y = linsolve(A, b);

t = linspace(0, 1, n+1);

disp(A)
disp(b)
plot(t, y);
hold on

% h = 1/16
n = 15;
h =  1/16;
f = @(x) -2*(-1*x^3-9*x^2+3*x+3)/((x^2+1)^3);

A = zeros(n+1, n+1);
A(1,1) = 1;
A(n+1, n+1) = 1;
for i = 2:n
    A(i-1, i) = 1;
    A(i, i) = -2;
    A(i, i-1) = 1;
end
A(n,n+1) = 1;
A(1,2) = 0;
disp(A)

b = zeros(n+1);
b(1) = 3;
x = 0;
for i = 2:n
    x = x+h;
    b(i) = h^2*f(x);
end
b(n+1) = 2;
disp(b)


y = linsolve(A, b);

t = linspace(0, 1, n+1);

disp(A)
disp(b)
plot(t, y);
hold on

% h = 1/32
n = 31;
h =  1/32;
f = @(x) -2*(-1*x^3-9*x^2+3*x+3)/((x^2+1)^3);

A = zeros(n+1, n+1);
A(1,1) = 1;
A(n+1, n+1) = 1;
for i = 2:n
    A(i-1, i) = 1;
    A(i, i) = -2;
    A(i, i-1) = 1;
end
A(n,n+1) = 1;
A(1,2) = 0;
disp(A)

b = zeros(n+1);
b(1) = 3;
x = 0;
for i = 2:n
    x = x+h;
    b(i) = h^2*f(x);
end
b(n+1) = 2;
disp(b)


y = linsolve(A, b);

t = linspace(0, 1, n+1);

disp(A)
disp(b)
plot(t, y);
hold on


%h = 1/64
n = 63;
h =  1/64;
f = @(x) -2*(-1*x^3-9*x^2+3*x+3)/((x^2+1)^3);

A = zeros(n+1, n+1);
A(1,1) = 1;
A(n+1, n+1) = 1;
for i = 2:n
    A(i-1, i) = 1;
    A(i, i) = -2;
    A(i, i-1) = 1;
end
A(n,n+1) = 1;
A(1,2) = 0;
disp(A)

b = zeros(n+1);
b(1) = 3;
x = 0;
for i = 2:n
    x = x+h;
    b(i) = h^2*f(x);
end
b(n+1) = 2;
disp(b)


y = linsolve(A, b);

t = linspace(0, 1, n+1);

disp(A)
disp(b)
plot(t, y);
hold on

% Now we will print the actual graph of the particular solution
fplot(@(t) (t+3)/(1+t^2),[0,1])

% all curves will be plotted by now