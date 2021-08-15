% Bluerov params
%Mass Bluerov2
Weight=98.1;
%Net Buoyant force
Buoyant = 100.062;
%Moment around X
Ix = 0.16;
%Moment around Y
Iy = 0.16;
%Moment around Xz
Iz = 0.16;
%Added Water Mass around x,y,z,theta,phi,psi
Xu_dot = -5.5;
Yv_dot = -12.7;
Zw_dot = -14.57;
Kp_dot = -0.12;
Mq_dot = -0.12;
Nr_dot = -0.12;
%Centre of gravity
rg = [0 0 0.2];
% Gravity
g = 9.81; % [m/s^2]

%DcGain

Kr = 1.0000e-01;

% Linear Skin friction
Xu = 4.03;
Yv = 6.22;
Zw = 5.18;
Kp = 0.07;
Mq = 0.07;
Nr = 0.07;

% Quadratic damping

Xu_u = 18.18;
Yv_v = 21.66;
Zw_w = 36.99;
Kp_p = 1.55;
Mq_q = 1.55;
Nr_r = 1.55;

% Rigid Body Mass & Water added Mass matrix
Mrb = [11.5 0 0 0 0 0;0 11.5 0 0 0 0;0 0 11.5 0 0 0;0 0 0 0.16 0 0;0 0 0 0 0.16 0;0 0 0 0 0 0.16];
Ma = [-5.5 0 0 0 0 0;0 -12.7 0 0 0 0;0 0 -14.57 0 0 0;0 0 0 -0.12 0 0;0 0 0 0 -0.12 0;0 0 0 0 0 -0.12];
M = Mrb + Ma;


%Thruster Allocation Matrix
Thruster_Configuration_Matrix = [0 0 0 0 0 0 ;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0;0 0 0 0 0 0; 0.707 0.707 -0.707 -0.707 0 0;0.707 -0.707 0.707 -0.707 0 0;0 0 0 0 1 1;0.051 -0.051 0.051 -0.051 -0.11 0.11;-0.051 -0.051 0.051 0.051 -0.0025 -0.0025;0.1655 -0.1655 -0.175 0.175 0 0];
% State space representation for linear modelisation
A = [0 0 0 0 0 0 1 0 0 0 0 0;0 0 0 0 0 0 0 1 0 0 0 0;0 0 0 0 0 0 0 0 1 0 0 0;0 0 0 0 0 0 0 0 0 1 0 0;0 0 0 0 0 0 0 0 0 0 1 0;0 0 0 0 0 0 0 0 0 0 0 1;0 0 0 -((Weight-Buoyant)/(10 + Xu_dot)) 0 0 -(Xu/(10 + Xu_dot)) 0 0 0 0 0; 0 0 0 0 (-(Weight-Buoyant)/(10 + Yv_dot)) 0 0 -(Yv/(10 + Yv_dot)) 0 0 0 0;0 0 0 0 0 0 0 0 -(Zw/(10 + Zw_dot)) 0 0 0;0 0 0 0 -((0.02*Weight)/(Ix + Kp_dot)) 0 0 0 0 -(Kp/(Ix + Kp_dot)) 0 0; 0 0 0 -((0.02*Weight)/(Iy + Mq_dot)) 0 0 0 0 0 0 -(Mq/(Iy + Mq_dot)) 0;0 0 0 0 0 0 0 0 0 0 0 -(Nr/(Iz + Nr_dot))];  
B = Thruster_Configuration_Matrix;
C = eye(12);
D = zeros(12,6);

Bluerov2_Sys =ss(A,B,C,D);

Bluerov2_Sys.StateName = {'X Pose';'Y Pose';'Z Pose';'Pitch';'Roll';'Yaw';'Vel X';'Vel Y';'Vel Z';'Vel Pitch';'Vel Roll';'Vel Yaw'};
Bluerov2_Sys.InputName = {'th0';'th1';'th2';'th3';'th4';'th5'};
Bluerov2_Sys.OutputName = {'xb';'yb';'zb';'phi_b';'theta_b';'psi_b';'vxb';'vyb';'vzb';'vphib';'vthetab';'vpisb'};


% Process noise covariance
Q = 1.2e-3;
% % Measurement noise covariance
R = 5e-6;
S = 1.1519236000000001e-06;
% Sampling time
Ts = 0.01; % [s] 
