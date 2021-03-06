%given
A = [1, 1; 0, 1];
B = [0;1];
Q = eye(2);
P = eye(2);
R = 0.1;
N = 3;
x0=[-1;-1];

x = cell(1, N + 1);
x{1} = x0;
u = cell(1, N);

H = 2 * [1 0 0 0 0 0 0 0 0;0 1 0 0 0 0 0 0 0;0 0 0.1 0 0 0 0 0 0;...
    0 0 0 1 0 0 0 0 0; 0 0 0 0 1 0 0 0 0; 0 0 0 0 0 0.1 0 0 0;...
    0 0 0 0 0 0 1 0 0; 0 0 0 0 0 0 0 1 0; 0 0 0 0 0 0 0 0 0.1];

% H =zeros(6, 6);
% H(1,1)=1;
% H(2, 2) = 0.1;
% H(3, 3) = 1;
% H(4, 4) = 0.1;
% H(5, 5) = 1;
% H(6, 6) = 0.1;



f = zeros(1, 9)';

Aineq = [1 0 0 0 0 0 0 0 0; -1 0 0 0 0 0 0 0 0;...
    0 1 0 0 0 0 0 0 0;  0 -1 0 0 0 0 0 0 0;...
    0 0 1 0 0 0 0 0 0;  0 0 -1 0 0 0 0 0 0;...
    0 0 0 1 0 0 0 0 0;  0 0 0 -1 0 0 0 0 0;...
    0 0 0 0 1 0 0 0 0;  0 0 0 0 -1 0 0 0 0;...
    0 0 0 0 0 1 0 0 0;  0 0 0 0 0 -1 0 0 0;...
    0 0 0 0 0 0 1 0 0;  0 0 0 0 0 0 -1 0 0;...
    0 0 0 0 0 0 0 1 0;  0 0 0 0 0 0 0 -1 0;...
    0 0 0 0 0 0 0 0 1;  0 0 0 0 0 0 0 0 -1;];

bineq = [15; 15;15; 15; 1; 1;15; 15;15; 15; 1; 1; 15; 15;15; 15; 1; 1];

temp = A^2*B;

Aeq = [1 0 -B(1) 0 0 0 0 0 0;...
    0 1 -B(2) 0 0 0 0 0 0;...
    0 0  (-A(1,:) * B), 1 0 -B(1) 0 0 0;...
    0 0  (-A(2,:) * B), 0 1 -B(2) 0 0 0;...
    0 0  -temp(1) 0 0 (-A(1,:) * B) 1 0 -B(1);...
    0 0  -temp(2) 0 0 (-A(2,:) * B) 0 1 -B(2)];

beq = [A*x0; A^2 * x0; A^3 *x0];

[U,FVAL,EXITFLAG,OUTPUT] = quadprog(H, f, Aineq, bineq, Aeq, beq);

U = [U(3); U(6); U(9)]


