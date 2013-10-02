p0 = [0, 1]; p1 = [0, -1];
b = p0 + [1, 1.6];
c = p1 + [1, 1.6];

bQube = @(p0, p1, b, c, t) (1 - t)^3*p0 + 3*t*(1 - t)^2*b ...
  + 3*t^2*(1-t)*c + t^3*p1;

T = [0: 0.02: 1];
M = [];
for t = T
  M = [M; bQube(p0, p1, b, c, t)];
end 
x = M(:, 1);
y = M(:, 2);
% plot(x, y, -x, y, b(1), b(2), 'o', c(1), c(2), 'x');
hold on;
d = 1E-3;
axis equal;
for k=1:20 
  plot(x+k*d, y+k*d, -x+k*d*+0.9, y+k*d*0.5);
end
hold off;
