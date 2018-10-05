function [] = myDoubleIntegratorExample(S, N)

A = [1 1; 0 1];
B = [1/2; 1];

Q = [2 0 ;0 0];
R = 10;

P_lasttimestep = S;

end


function [P] = myP(k, S, N)
A = [1 1; 0 1];
B = [1/2; 1];

Q = [2 0 ;0 0];
R = 10;

if k == N
    P = S;
else
    P = A' * myP(k + 1, S, N) * A + Q - A' * myP(k + 1, S, N) * B * (R + B' * myP(k + 1, S, N) * B)^(-1)*
    (B' * myP(k + 1, S, N) * A);


