function [U, x0s] = myMPC(A, B, Nc, S, Q, R, x0, N)

U = [];

x0s = zeros(1, Nc + 1);
x0s(1) = x0;
w = normrnd(0, 0.1, 1, Nc);
%for i = 2 : Nc
%    x0s(i) = +()*rand;    
%end

for i = 1 : Nc
    [u] = myFMINCON(A, B, N, S, Q, R, x0s(i));
    x0s(i + 1) = A * x0s(i) + B * u(1) + w(i);
    u = u';
    U = [U; u];
end

U = U(:, 1);

end
