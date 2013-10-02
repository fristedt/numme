% y'' + pi*y*e^(x/3)*(2*y'*sin(pi*x)+pi*y*cos(pi*x)) = y / 9
% y(0) = 1, y'(0) = -1/3

% u1 = y
% u2 = y'

% u1' = u2
% u2' = u1 / 9 - pi - (pi*u1*exp(x/3)*(2*u2*sin(pi*x)+pi*u1*cos(pi*x)))

mopt=odeset('RelTol',1.E-6);
x0 = 0; xEnd = 2.6;
uStart = [1 -1/3];

[X, U] = ode45(@fp, [x0 xEnd], uStart, mopt);
plot(X, U(:,1))
