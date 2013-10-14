% Trapetsmetoden
% Integralen y(x), med avseende på x, från a till b kan approximeras med trapetsmetoden:
% (b - a) * (y(a) + y(b))/2
% Indata.
h = 0.1
b = 2.6
a = 0
% h = (b - a) / n => n = (b - a) / h
n = (b - a) / h

y = @(x) exp(-x./3)./(2 - cos(pi.*x));
y2 = @(x) (exp(-x./3)./(2 - cos(pi.*x))).^2;

x = h * (0:n);
y2x = y2(x);

% Trapetsmetoden.
t = @(f, h) h * (sum(f) - (f(1) + f(n + 1)) / 2)

V1 = pi * t(y2x, h) % 1.6406

h = 0.05;
n = (b - a) / h;
x = h * (0:n);
y2x = y2(x);


V2 = pi * t(y2x, h) % 1.6372
% S = T(h/2) + (T(h/2) - T(h))/(2^2-1)
% B = S(h/2) + ((S(h/2) - S(h))/(2^4-1)
S = V2 + (V2 - V1) / 3 % 1.6361
% Vi kan av V1, V2 och S dra slutsatsen att volymen av
% rotationskroppen är (tre siffors precision) 1.64.

% V bekräftar ovanstående slutsats.
V = pi * integral(y2, a, b) % 1.6392

x = [a: 0.02: b]';
f = y(x);
fi = [0: 2 * pi / 30: 2 * pi];
X = x * ones(size(fi));
Y = f * cos(fi);
Z = f * sin(fi);
surf(X, Y, Z)
% Rotationskroppen har en längd på 2.6 och verkar ha en genomsnitts-
% radie på 0.4. Dess volym borde därför vara Ve = 2.6 * pi * 0.4^2.

Ve = 2.6 * pi * 0.4^2 % 1.3069
% Ovanstående gissning är inte korrekt eftersom gissningen på 
% radien är extremt grov, men resultatet är i samma bollpark som
% vår volymberäkning via trapetsmetoden att vi kan lita på att 
% rotationskroppens volym är ungefär 1.64.
