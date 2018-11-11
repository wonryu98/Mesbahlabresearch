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


H = 2*[8.1 4 1,;4, 3.1, 1; 1 , 1 1.1];
f= [-28 -12 -2]';
%f= [-28 -28 -12 -12 -2 -2]';
bound = [15 15]';
Aineq = [B, [0; 0], [0; 0];...
         -B, [0; 0], [0; 0];...
         A*B, B,[0; 0];...
         -A*B, -B,[0; 0];...
          A^2 * B, A * B, B;...
          -A^2 * B, -A * B, -B];
bineq = [bound - A * x0; bound + A * x0; bound - A^2 * x0;bound + A^2 * x0;...
    bound - A^3 * x0; bound + A^3 * x0];

[U,FVAL,EXITFLAG,OUTPUT] = quadprog(H, f, Aineq, bineq, [], [],[-1 -1 -1]', [1 1 1]')
