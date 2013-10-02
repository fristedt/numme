% y'' + pi*y*e^(x/3)*(2*y'*sin(pi*x)+pi*y*cos(pi*x)) = y / 9
% y(0) = 1, y'(0) = -1/3

% u1 = y
% u2 = y'

% u1' = u2
% u2' = u1 / 9 - pi - (pi*u1*exp(x/3)*(2*u2*sin(pi*x)+pi*u1*cos(pi*x)))

mopt=odeset('RelTol',1.E-6);
x0 = 0; xEnd = 2.6;
uStart = [1 -1/3 0];

[X, U] = ode45(@fp2b, [x0 xEnd], uStart, mopt);
subplot(1, 2, 1);
plot(X, U(:,1))
U(end) % 1.6392
% Genom att skriva ut resultatet U ser vi att u3(2.6)=1.6392.
% Detta är volymen av rotationskroppen i uppgift 1.

x0 = 0; xEnd = 2.6;
uStart = [1 -1/3 0];

[X, U] = ode45(@fp2b, [x0 xEnd], uStart);
subplot(1, 2, 2);
plot(X, U(:,1))
U(end) % 1.6216
% Genom att minska toleransen får vi en sämre approximation. Resultatet
% är fortfarande helt ok.

