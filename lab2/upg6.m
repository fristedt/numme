% Indata.
clear, clf, hold off
global x h yL yR
format short e, format compact
N = 10; a = 1; b = 3; uL = 2; uR = 4;
h = (b-a)/(N+1); x = [a+h:h:b-h]';
u = uL+(uR-uL)/(b-a)*x; % Linjär interpolation mellan endpunkterna.
du = u;

norms = [];
i = 0;
while norm(du, inf) > 1.E-12 * norm(u, inf),
  i = i + 1;
  F = f(u); J=minjac('f', u);
  du = -J\F; u = u + du;
  norms = [norms; norm(du, inf)];
end
xp = [a;x;b]; yp = [uL;u;uR];
plot(xp, yp); grid; %spy(J);
disp('N = 10');
disp(i);
disp(norms);

N = 50;
h = (b-a)/(N+1); x = [a+h:h:b-h]';
u = uL+(uR-uL)/(b-a)*x; % Linjär interpolation mellan endpunkterna.
du = u;

norms = [];
i = 0;
while norm(du, inf) > 1.E-12 * norm(u, inf),
  i = i + 1;
  F = f(u); J=minjac('f', u);
  du = -J\F; u = u + du;
  norms = [norms; norm(du, inf)];
end
disp('N = 50');
disp(i);
disp(norms);


