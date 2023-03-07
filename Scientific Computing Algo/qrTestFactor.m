rng(101)
m = 2;
n = m;
tol = 1.e-4;
A = rand(m,n);
A = A + A';

[V,E] = eig(A); % <- this sets V as vectors, E as diagonal matrix of
                % eigenvalues
VA = V %% this returns the eigenvectors
EA = diag(E)' %% this returns the diagonal as a row matrix of eigenvalues



diagAOld = zeros(n,1);
for i = 1:5
    [Q,R] = qr(A);
    A = R*Q
end
