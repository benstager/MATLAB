function f = qrPlayGround(A,n)

for i = 1:n
    [Q,R]= qr(A);
    A = R*Q;
end

A
eig(A)
