

% plotting the Boussinesq equation



[T,X] = meshgrid(0:.005:1,-50:.5:50);

U = .1*tanh(.5*(X+T/sqrt(10)));
surf(T,X,U)
xlabel('t')
ylabel('x')
zlabel('u(x,t)')
shading interp