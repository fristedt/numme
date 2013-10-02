% Indata
f = @(x) 60.*x - (x.^2+x+0.1).^6/(x+1).^6 - 10.*x.*exp(1).^-x;
df = @(x) 60 + (6*(x.^2+x+0.1)^6)/((x+1)^7) - ...
    (6*(2*x+1)*(x.^2+x+0.1)^5)/(x+1).^6-10*exp(-x)+10*exp(-x)*x;
x0 = 0.5;
x1 = 2;
tolerance = 1e-6;

format long;

% Beräkning
mynewton(f, df, x0, tolerance)
mynewton(f, df, x1, tolerance)
