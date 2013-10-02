x = @(delta) cos(delta).^3;
y = @(delta) 1.5*sin(delta) - sin(delta).^3;
delta = 0 : 0.01 : pi / 2;
yp = 0.64;

x0 = 0;
x1 = 1;

tolerance = 1e-10;

y0 = @(delta) 1.5*sin(delta) - sin(delta).^3 - 0.64;
dy0 = @(delta) 1.5*cos(delta) - 3*cos(delta)*sin(delta)^2;
delta0 = newton(y0, dy0, x0, tolerance);
delta1 = newton(y0, dy0, x1, tolerance);

plot(x(delta), y(delta), x(delta0), yp, '*', x(delta1), yp, '*');
