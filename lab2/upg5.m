% Indata.
clear, clf, hold off
global x h yL yR
format short e, format compact
N = 19; a = 1; b = 3; uL = 2; uR = 4;
h = (b-a)/(N+1); x = [a+h:h:b-h]';
u = uL+2*x;
du = u;

while norm(du, inf) > 1.E-12 * norm(u, inf),
  F = f(u); J=minjac('f', u);
  du = -J\F; u = u + du;
  norm(du, inf);
end
xp = [a;x;b]; yp = [uL;u;uR];
plot(xp, yp);% grid; spy(J);
