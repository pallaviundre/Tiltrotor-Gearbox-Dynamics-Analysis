function tiltrotor_gearbox_linear()
% Linearized model simulation

J1 = 2; J2 = 1; J3 = 0.5;
K1 = 1000; B1 = 10; beta = 5;

% Linearized Jacobian matrix
A = [-B1/J1   -K1/J1     0;
      1        0       -0.5;
      0   K1/(J3+0.5*J2)  (-1.5-3*beta*(0.1538)^2)/(J3+0.5*J2)];

B = [1/J1; 0; 0];

x0 = [0;0;0];
tspan = [0 10];

% Step inputs
Tm1 = 1;
Tm2 = 29;

[t1,x1] = ode45(@(t,x) A*x + B*Tm1, tspan, x0);
[t2,x2] = ode45(@(t,x) A*x + B*Tm2, tspan, x0);

figure;
subplot(2,1,1)
plot(t1, x1(:,2))
title('Linearized Response: Tm = 2 Nm')
xlabel('Time (s)'); ylabel('\theta_1 - \theta_2 (rad)')

subplot(2,1,2)
plot(t2, x2(:,2))
title('Linearized Response: Tm = 30 Nm')
xlabel('Time (s)'); ylabel('\theta_1 - \theta_2 (rad)')
end
