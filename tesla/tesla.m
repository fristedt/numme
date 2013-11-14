% Konstanter.
clear all
global a C cp
a  = 0.1;
I0 = 2.0;
ur = 40000;
C  = ur * I0 * a * 1e-7;
cp = 2e7;
mopt=odeset('RelTol',1.E-3);%, 'OutputFcn', @odephas3);
tspan = [0 10];
xlabel('X');
ylabel('Y');
zlabel('Z');

% Funktioner.
r0 = 0.2 * a;
z0 = 0;
[V, RZ] = ode45(@fp, tspan, [r0 z0], mopt);
r = RZ(:,1);
z = RZ(:,2);
hold on;
plot3(r, zeros(size(r)), z);

r0 = 0.3 * a;
[V, RZ] = ode45(@fp, tspan, [r0 z0], mopt);
r = RZ(:,1);
z = RZ(:,2);
plot3(r, zeros(size(r)), z);

r0 = 0.4 * a;
[V, RZ] = ode45(@fp, tspan, [r0 z0], mopt);
r = RZ(:,1);
z = RZ(:,2);
plot3(r, zeros(size(r)), z);

r0 = 0.5 * a;
[V, RZ] = ode45(@fp, tspan, [r0 z0], mopt);
r = RZ(:,1);
z = RZ(:,2);
plot3(r, zeros(size(r)), z);

mopt=odeset('OutputFcn', @odeprint);

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
plot3(S(:,1),S(:,3), S(:,5));
hold off;
