m = 3;
n = 3;
A = rand(m,n);

[L,U] = lu(A);

p = 4;
q = 4;
B = rand(4,4);

[Q,R] = qr(B);