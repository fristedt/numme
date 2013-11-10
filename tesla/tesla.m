% Konstanter.
clear all
global a I0 ur C 
a  = 0.1;
I0 = 2.0;
ur = 40000;
C  = ur * I0 * a * 1e-7;
r0 = 0.5 * a;
z0 = 0;
% mopt=odeset('RelTol',1.E-6);

% Funktioner.
% integral(@(fi) )
% tmp = @(fi) z .* sin(fi) ./ sqrt((r - a.*cos(fi)).^2 + a.^2.*sin(fi).^2 + z.^2)
% tmp([0: 0.1: pi])
% br = @(r, z) C * integral(@(fi) z .* sin(fi) ./ sqrt((r - a.*cos(fi)).^2 + a.^2.*sin(fi).^2 + z.^2), -pi, pi);
% bz = @(r, z) C * integral(@(fi) (a - r .* cos(fi)) ./ sqrt((r - a.*cos(fi)).^2 + a.^2.*sin(fi).^2 + z.^2), -pi, pi);
[V, RZ] = ode45(@fp, [-1e5 1e5], [r0 z0]);
r = RZ(:,1)
z = RZ(:,2)
subplot(2, 2, 1); plot(V, r, V, z, '--');
subplot(2, 2, 2); plot(r, z);
