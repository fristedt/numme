f = @(x) 60*x - (x^2+x+0.1)^6/(x+1)^6 - 10*x*exp(-x);
% 2a
df = @(x) 60 + (6*(x^2+x+0.1)^6)/((x+1)^7) - ...
    (6*(2*x+1)*(x^2+x+0.1)^5)/(x+1)^6-10*exp(-x)+10*exp(-x)*x;

% 2b is in file myfdiff.m and mycdiff.m

% 2c
x = 0.2;
h = 1e-6;
fdiff = myfdiff(f, x, h);
cdiff = mycdiff(f, x, h);
df(x);

x = 1;
mycdiff(f, x, h);
df(x);

% 2d
cdiff = [];
fdiff = [];

hin = [1.E-3 1.E-4 1.E-5 1.E-6 1.E-7 1.E-8 1.E-9 1.E-10 1.E-11 1.E-12 1.E-13];
for h=hin
    cdiff = [cdiff; mycdiff(f, x, h)];
    fdiff = [fdiff; myfdiff(f, x, h)];
end

rc = abs(cdiff - df(x));
rf = abs(fdiff - df(x));
disp([hin' rc rf]);

%subplot(2,2,1);
loglog(hin, rc, hin, rf);

%subplot(2,2,2);
%loglog(
