x0 = 1; x1 = 0;
y0 = 0; y1 = 0.5;
p1 = [x0, y0]; p2 = [x1, y1];

% 0.5 < yb, yc < 1
yb = 0.6; yc = 0.9;

b = [1, yb]; c = [0.12, yc];
T = [0: 0.01: 1];

bQube = @(p1, p2, b, c, t) (1 - t)^3*p1 + 3*t*(1 - t)^2*b + 3*t^2*(1-t)*c + t^3*p2;

R = [];
for t = T
  R = [R; bQube(p1, p2, b, c, t)];
end 
hold on;
plot(R(:, 1), R(:, 2), -R(:, 1), R(:, 2))

t = [0: 2*pi/50: 2*pi];
x = cos(t);
y = sin(t);
plot(x, y);

bSquare = @(p1, p2, b, t) (1-t)^2*p1 + 2*t*(1-t)*b + t^2*p2;
p1 = [-0.6, -0.4]; p2 = [0.6, -0.4];
b = -0.6;

R = [];
for t = T
  R = [R; bSquare(p1, p2, b, t)];
end
plot(R(:, 1), R(:, 2));

t = [0: 2*pi/50: 2*pi];
c = [0.4, 0.2];
r = 0.1;
x = c(1) + r * cos(t);
y = c(2) + r * sin(t);
plot(x, y, -x, y);

hold off;

