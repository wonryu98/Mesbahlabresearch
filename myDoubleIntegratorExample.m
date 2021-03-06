function [P, K, U_opt, x_opt] = myDoubleIntegratorExample(S, N, x0)
P = cell(N+1, 1);
K = cell(N+1, 1);
U_opt = cell(N+1, 1);
x_opt = cell(N+1, 1);


A = [1 1; 0 1];
B = [1/2; 1];

Q = [2 0 ;0 0];
R = 10;

P{N + 1} = S;
x_opt{1} = x0;

% iterate backwards to get K and P
for j = N: -1: 1
    P{j} = A' * P{j + 1} * A + Q - A' * P{j + 1} * B * (R + B' * P{j + 1} * B)^(-1) * (B' * P{j + 1} * A);
    K{j} = (R + B' * P{j + 1} * B)^(-1) * B' * P{j + 1} * A;
end

%iterate forward to get u_prime and x_prime
for j = 1: N
    U_opt{j} = -K{j} * x_opt{j};
    x_opt{j + 1} = A * x_opt{j} + B * U_opt{j};
    
end

%[Pinf,L,Kinf] = dare(A,B,Q,R);

end

function myPlot()
y=[];

for i = 1:31
    y1 = P{i}(1,1);
    y = [y y1];
end
plot(1:31, y)
end