% Transfer function and frequency-domain analysis

J1 = 2; J2 = 1; J3 = 0.5;
K1 = 1000; B1 = 10; beta = 5;

A = [-B1/J1   -K1/J1     0;
      1        0       -0.5;
      0   K1/(J3+0.5*J2)  (-1.8555)];

B = [1/J1; 0; 0];
C = [0 1 0];
D = 0;

sys = ss(A,B,C,D);

% Poles and zeros
[p,z] = pzmap(sys);
disp('Poles:'); disp(p)
disp('Zeros:'); disp(z)

% Natural frequency and damping ratio
wn = abs(p(2));
zeta = -real(p(2))/wn;

fprintf('Natural Frequency = %.3f rad/s\n',wn)
fprintf('Damping Ratio = %.4f\n',zeta)

% Bode plot
figure;
bode(sys)
grid on
