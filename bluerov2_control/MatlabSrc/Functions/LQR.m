Q_state = eye(12);
R_control = 0.001;


[K, S, E] = lqr(A, B, Q_state, R_control);

disp('K computed via LQR:')
K

disp('S computed via LQR:')
S

disp('E computed via LQR:')
E