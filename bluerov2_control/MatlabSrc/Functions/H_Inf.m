% Using H infinity
parameters;

%{

Augmented Matrix for bluerov2

For this function the 1st parameter is the state space (A, B, C, D)
The 2nd parameter is the weight on error signal
The 3rd parameter is the weight on the control signal
The 4th parameter is the weight on the output signal
%}

Aug_Bluerov = augw(Bluerov2_Sys,1,1,1);
% P = pck(Bluerov2_Sys,1,1,1);

[K_Inf,CL,gamma] = hinfsyn(Aug_Bluerov);
% 
% 
% 
% unpck(K_Inf)
