%given
A = [1, 1; 0, 1];
B = [0;1];
Q = eye(2);
P = eye(2);
R = 0.1;
N = 3;
x1=[-1;-1];

x = cell(1, N + 1);
x{1} = x1;
u = cell(1, N);

syms u1
syms u2
syms u3

u{1} = u1;
u{2} = u2;
u{3} = u3;

J =0;

for i = 1:N
    J = J + x{i}' * Q * x{i} + u{i}' * R * u{i};
    x{i + 1} = A * x{i} + B * u{i};
end
J = J + x{N+1}' * P * x{N+1};






