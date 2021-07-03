% Author: Melda Ulusoy
% Copyright 2018 The MathWorks, Inc. 

% Pendulum model

% Gravity
g = 9.81; % [m/s^2]

% Rigid Body Mass & Water added Mass matrix
Mrb = [11.5 0 0 0 0 0;0 11.5 0 0 0 0;0 0 11.5 0 0 0;0 0 0 0.16 0 0;0 0 0 0 0.16 0;0 0 0 0 0 0.16];
Ma = [-5.5 0 0 0 0 0;0 -12.7 0 0 0 0;0 0 -14.57 0 0 0;0 0 0 -0.12 0 0;0 0 0 0 -0.12 0;0 0 0 0 0 -0.12];
M = Mrb + Ma;


% State space representation
A = [0 1; -g/l 0];
B = [0; 1/(m*l^2)];
C = [1 0];
D = 0;

% Process noise covariance
Q = 1e-3;
% Measurement noise covariance
R = 5e-3;
% Sampling time
Ts = 0.01; % [s] 




