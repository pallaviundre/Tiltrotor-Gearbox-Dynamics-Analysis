function tiltrotor_gearbox_nonlinear()
% Nonlinear vibration analysis of tiltrotor gearbox

% Parameters
J1 = 2; J2 = 1; J3 = 0.5;
K1 = 1000; B1 = 10; beta = 5;

% Initial conditions: [Omega1; theta1-theta2; Omega3]
x0 = [0; 0; 0];

% Time span
tspan = [0 10];

% Step input cases
Tm1 = @(t) 1 + (t >= 0);          % 1 -> 2 Nm
Tm2 = @(t) 1 + 29*(t >= 0);       % 1 -> 30 Nm

[t1, x1] = ode45(@(t,x) dynamics(t,x,Tm1(t),J1,J2,J3,K1,B1,beta), tspan, x0);
[t2, x2] = ode45(@(t,x) dynamics(t,x,Tm2(t),J1,J2,J3,K1,B1,beta), tspan, x0);

% Plot results
figure;
subplot(2,1,1)
plot(t1, x1(:,2))
title('Nonlinear Response: Tm = 2 Nm')
xlabel('Time (s)'); ylabel('\theta_1 - \theta_2 (rad)')

subplot(2,1,2)
plot(t2, x2(:,2))
title('Nonlinear Response: Tm = 30 Nm')
xlabel('Time (s)'); ylabel('\theta_1 - \theta_2 (rad)')

% Analysis
analyze_response(t1, x1(:,2), 'Tm = 2 Nm');
analyze_response(t2, x2(:,2), 'Tm = 30 Nm');
end

function dxdt = dynamics(~,x,Tm,J1,J2,J3,K1,B1,beta)
Omega1 = x(1);
theta_diff = x(2);
Omega3 = x(3);

Tnld = 1.5*Omega3 + beta*Omega3^3;

dOmega1 = (Tm - B1*Omega1 - K1*theta_diff)/J1;
dtheta  = Omega1 - 0.5*Omega3;
dOmega3 = (K1*theta_diff - Tnld)/(J3 + 0.5*J2);

dxdt = [dOmega1; dtheta; dOmega3];
end

function analyze_response(t,theta_diff,label)
steady = theta_diff(end);
overshoot = max(theta_diff) - steady;
[pks,locs] = findpeaks(theta_diff);

fprintf('%s | Steady: %.5f rad | Overshoot: %.5f rad\n',label,steady,overshoot);

if length(locs)>=2
    period = mean(diff(t(locs)));
    fprintf('%s | Period: %.4f s\n',label,period);
end
end
