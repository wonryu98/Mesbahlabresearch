function [U, x] = myFMINCON(A, B, N, S, Q, R, x0)


% A, b, Aeq, beq,lb, ub, nonlcon are constraints
%u  = fmincon(     fun,                           u0,         A,  b,  Aeq, beq,lb, ub,nonlcon)
[U] = fmincon(@(u) myJ(u, A, B, N, S, Q, R, x0), zeros(N, 1), [], [], [], [], -0.5 * ones(N, 1), [], []);
%[U] = fmincon(@(u) myJ(u, A, B, N, S, Q, R, x0), zeros(N, 1), -1 * eye(N), 0.4 * ones(N, 1), [], [], [], [], []);
x= zeros(1, N+1);
x(1) = x0;
for k = 1: N
    x(k+1) = A * x(k)+B * U(k);
end


end

%getting the cost function
function J = myJ(u, A, B, N, S, Q, R, x0)
J = 0;
x = zeros(N+1,1);
x(1) = x0;

for k = 1: N
    J = J + x(k)' * Q * x(k) + u(k)' * R * u(k);
    x(k+1) = A * x(k)+B * u(k);
end

J = J + x(end)' * S * x(end);
J= 1/2 * J;
end
