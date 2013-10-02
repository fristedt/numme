disp('Uppgift 1');

clf;

syms t;

% Funktionen x(t)
xn = @(t)(cos(t)^3);
% Funktionen y(t)
fn = @(t)(1.5*sin(t)-sin(t)^3-0.64);
% Funktionen y'(t)
fp = @(t)((3*cos(t))/2 - 3*cos(t)*sin(t)^2);

% Feltolerans
precision = 1e-10;

% Värden för x skapade m.h. av Newton-Raphsons metod.
xAxis = [];
% Statiska värden för y
yAxis = [0.64 0.64];

% Uppskatta x med startvärdet 0 och 1 samt spara resultatet i vektorn `xAvis`
for i = 0:1,
  x = newton(fn, fp, i, precision, 1);
  xAxis = [xAxis xn(x)];
end

hold on

% Rita ut punkter
scatter(xAxis, yAxis, '*')

% Rita cirkel.
range = 0:2*pi/100:2*pi;
plot(cos(range), sin(range));

% Rita kaustikakurvan
range = (0:2*pi/100:pi/2)';
xn = cos(range).^3;
yn = 1.5*sin(range)-sin(range).^3;
plot(xn, yn, -xn, yn), axis equal

hold off
