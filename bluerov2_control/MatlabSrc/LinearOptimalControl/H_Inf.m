
% Using H infinity

parameters;

d = [0;0;0;0;0;0;1;1;1;0;0;0];
Dd = [D zeros(12, 1)];

Bd = [B d];
Bluerov2_Sys =ss(A,Bd,C,Dd);

Bluerov2_Sys.StateName = {'X Pose';'Y Pose';'Z Pose';'Pitch';'Roll';'Yaw';'Vel X';'Vel Y';'Vel Z';'Vel Pitch';'Vel Roll';'Vel Yaw'};
Bluerov2_Sys.InputName = {'th0';'th1';'th2';'th3';'th4';'th5';'r'};
Bluerov2_Sys.OutputName = {'xb';'yb';'zb';'phi_b';'theta_b';'psi_b';'vxb';'vyb';'vzb';'vphib';'vthetab';'vpisb'};

tzero(Bluerov2_Sys({'xb','yb','zb','phi_b','theta_b','psi_b','vxb','vyb','vzb','vphib','vthetab','vpisb'},'th0'))

bodemag(Bluerov2_Sys({'xb','yb','zb'},'r'),'b',Bluerov2_Sys({'xb','yb','zb'},{'th0'}),'r',{1 100});

