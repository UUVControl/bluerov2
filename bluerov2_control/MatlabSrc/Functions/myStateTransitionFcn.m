function x = myStateTransitionFcn(x,u)

Mrb = [11.5 0 0 0 0 0;0 11.5 0 0 0 0;0 0 11.5 0 0 0;0 0 0 0.16 0 0;0 0 0 0 0.16 0;0 0 0 0 0 0.16];
Ma = [-5.5 0 0 0 0 0;0 -12.7 0 0 0 0;0 0 -14.57 0 0 0;0 0 0 -0.12 0 0;0 0 0 0 -0.12 0;0 0 0 0 0 -0.12];
M = Mrb + Ma;
dt = 0.01;

% Hydrostatics Matrix
g =[(98.1-1.986)*sin(x(5));
    -(98.1-1.986)*cos(x(5))*sin(x(4));
    (98.1-1.986)*cos(x(5))*cos(x(4));
    0.02*98.1*cos(x(5))*sin(x(4));
    0.02*98.1*cos(x(5));0];

% Skin friction & quadratic damping
Dv = [4.03+18.18*abs(x(7)) 0 0 0 0 0;
        0 6.22+21.66*abs(x(8)) 0 0 0 0;
        0 0 5.18+36.99*abs(x(9)) 0 0 0;
        0 0 0 0.07+1.55*abs(x(10)) 0 0;
        0 0 0 0 0.07+1.55*abs(x(11)) 0;
        0 0 0 0 0 0.07+1.55*abs(x(12))];

%Position Matrix
pos =[cos(x(6))*sin(x(5))*x(7) cos(x(6))*sin(x(5))*sin(x(4))*x(8)-sin(x(6))*cos(x(4))*x(8) sin(x(6))*sin(x(4))*x(9)+cos(x(6))*cos(x(4))*sin(x(5))*x(9) 0 0 0;
            sin(x(6))*cos(x(5))*x(7) cos(x(6))*cos(x(4))*x(8)+sin(x(4))*sin(x(5))*sin(x(6))*x(8) sin(x(5))*sin(x(6))*cos(x(5))*x(9)-cos(x(6))*sin(x(4))*x(9) 0 0 0;
            -sin(x(5))*x(7) cos(x(5))*sin(x(4))*x(8) cos(x(5))*cos(x(4))*x(9) 0 0 0;
            0 0 0 x(10) sin(x(4))*tan(x(5))*x(11) cos(x(4))*tan(x(5))*x(12);
            0 0 0 0 cos(x(5))*x(11) -sin(x(5))*x(12);
            0 0 0 0 (sin(x(4))*x(11))/cos(x(5)) (cos(x(4))*x(12))/cos(x(5))];

%Velocity Matrix
vel = [(-sum(Dv(1,:))-sum(g(1,:)))/sum(M(1,:));
        (-sum(Dv(2,:))-sum(g(2,:)))/sum(M(2,:));
        (-sum(Dv(3,:))-sum(g(3,:)))/sum(M(3,:));
        (-sum(Dv(4,:))-sum(g(4,:)))/sum(M(4,:));
        (-sum(Dv(5,:))-sum(g(5,:)))/sum(M(5,:));
        (-sum(Dv(6,:))-sum(g(6,:)))/sum(M(6,:))];

%state transition using euler discretisation
x = x +[cos(x(6))*cos(x(5))*x(7)+cos(x(6))*sin(x(4))*sin(x(5))*x(8)-sin(x(6))*cos(x(4))*x(8)+sin(x(6))*sin(x(4))*x(9)+cos(x(6))*cos(x(4))*sin(x(5))*x(9);
        sin(x(6))*cos(x(5))*x(7)+cos(x(6))*cos(x(4))*x(8)+sin(x(4))*sin(x(5))*sin(x(6))*x(8)-cos(x(6))*sin(x(4))*x(9)+sin(x(5))*sin(x(6))*cos(x(5))*x(9);
        -sin(x(5))*x(7)+cos(x(5))*sin(x(4))*x(8)+cos(x(5))*cos(x(4))*x(9);
        x(10)+sin(x(4))*tan(x(5))*x(11)+cos(x(4))*tan(x(5))*x(12);
        cos(x(4))*x(11)-sin(x(4))*x(12);
        (sin(x(4))*x(11))/cos(x(5))+(cos(x(4))*x(12))/cos(x(5));
        vel(1,:)+u(1,:);
        vel(2,:)+u(2,:);
        vel(3,:)+u(3,:);
        vel(4,:)+u(4,:);
        vel(5,:)+u(5,:);
        vel(6,:)+u(6,:)]*dt;

end
