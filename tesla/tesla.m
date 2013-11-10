% Konstanter.
clear all
global a C 
a  = 0.1;
I0 = 2.0;
ur = 40000;
C  = ur * I0 * a * 1e-7;
mopt=odeset('RelTol',1.E-9);

% Funktioner.
r0 = 0.2 * a;
z0 = 0;
[V, RZ] = ode45(@fp, [-pi 5*pi], [r0 z0], mopt);
r = RZ(:,1);
z = RZ(:,2);
hold on;
plot(r, z);

r0 = 0.3 * a;
[V, RZ] = ode45(@fp, [-pi 5*pi], [r0 z0], mopt);
r = RZ(:,1);
z = RZ(:,2);
plot(r, z);

r0 = 0.4 * a;
[V, RZ] = ode45(@fp, [-pi 5*pi], [r0 z0], mopt);
r = RZ(:,1);
z = RZ(:,2);
plot(r, z);

r0 = 0.5 * a;
[V, RZ] = ode45(@fp, [-pi 5*pi], [r0 z0], mopt);
r = RZ(:,1);
z = RZ(:,2);
plot(r, z);
hold off;
