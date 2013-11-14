a  = 0.1;
I0 = 2.0;
ur = 40000;
C  = ur * I0 * a * 1e-7;
mopt=odeset('OutputFcn', @odephas3, 'OutputSel', [1 3 5]);

format long;

v0 =  2e5;

x0 =  1.4*a;
dx0 = 0;

y0 =  0;
dy0 = v0;

z0 =  0.15*a;
dz0 = 0;

s0 = [x0
      dx0 
      y0
      dy0 
      z0 
      dz0];

[T, S] = ode45(@fp2, [0 1], s0, mopt);
S

% subplot(2, 2, 1);
% plot3(S(:,1), S(:,3), S(:,5));
% subplot(2, 2, 2);
% plot3(S(:,2), S(:,4), S(:,6));
