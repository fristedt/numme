% Konstanter.
clear all
global a C cp
a  = 0.1;
I0 = 2.0;
ur = 40000;
C  = ur * I0 * a * 1e-7;
cp = 2e7;

tspan = [0 5];
xlabel('r');
ylabel('z');

% Startgissning.
r0 = 0.2 * a;
z0 = 0;
[V, RZ] = ode45(@fp, tspan, [r0 z0]);
r = RZ(:,1);
z = RZ(:,2);
hold on;
plot(r, z);

% Startgissning.
r0 = 0.3 * a;
[V, RZ] = ode45(@fp, tspan, [r0 z0]);
r = RZ(:,1);
z = RZ(:,2);
plot(r, z);

% Startgissning.
r0 = 0.4 * a;
[V, RZ] = ode45(@fp, tspan, [r0 z0]);
r = RZ(:,1);
z = RZ(:,2);
plot(r, z);

% Startgissning.
r0 = 0.5 * a;
[V, RZ] = ode45(@fp, tspan, [r0 z0]);
r = RZ(:,1);
z = RZ(:,2);
plot(r, z);

