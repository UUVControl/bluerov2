% Copyright 2018 The MathWorks, Inc. 

function x = myStateTransitionFcn(x,u)
% Sample time [s]
dt = 0.01; 

% Using Euler discretization, next states
% can be calculated given the current
% states and input 
x = x + [x(2); -9.81/0.5*sin(x(1)) + u]*dt;

x = x + [cos(x(6))*sin(x(5)) cos(x(6))*sin(x(5))*sin(x(4))-sin(x(6))*cos(x(4)) sin(x(6))*sin(x(4))+cos(x(6))*cos(x(4))*sin(x(5)) 0 0 0;sin(x(6))*cos(x(5)) cos(x(6))*cos(x(4))+sin(x(4))*sin(x(5))*sin(x(6)) sin(x(5))*sin(x(5))*cos(x(4))-cos(x(6))*sin(x(4)) 0 0 0;-sin(x(5)) cos(x(5))*sin(x(4)) cos(x(5))*cos(x(4)) 0 0 0;0 0 0 1 sin(x(4))*tan(x(5)) cos(x(4))*tan(x(5));0 0 0 0 cos(x(5)) -sin(x(5));0 0 0 0 sin(x(4))/cos(x(5)) cos(x(4))/cos(x(5))];

end

