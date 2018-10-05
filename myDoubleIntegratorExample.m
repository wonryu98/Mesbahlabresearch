function [P, K, U_prime] = myDoubleIntegratorExample(S, N, x0)
P = [];
K = [];
U_prime = [];

A = [1 1; 0 1];
B = [1/2; 1];

Q = [2 0 ;0 0];
R = 10;

P_lasttimestep = S;

for j = (N - 1):1
    P_at_timestep = myP(j, S, N);
    P = [P P_at_timestep];
    
    K_at_timestep = (R + B' * myP(k + 1,S , N)* B)^(-1) * B' * myP(k + 1,S , N) * A;
    K = [K K_at_timestep];
end



end


function [P] = myP(k, S, N)
A = [1 1; 0 1];
B = [1/2; 1];

Q = [2 0 ;0 0];
R = 10;

if k == N
    P = S;
else
    P = A' * myP(k + 1, S, N) * A + Q - A' * myP(k + 1, S, N) * B * (R + B' * myP(k + 1, S, N) * B)^(-1) * (B' * myP(k + 1, S, N) * A);
end
end
    
