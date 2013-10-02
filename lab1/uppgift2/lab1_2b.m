T= 365;
x = [1 32 60 91 121 152 182 213 244 274 305 335]';
y = [6.1 8.0 10.4 13.2 15.8 18.0 18.4 16.6 14.1 11.4 8.7 6.6]';
omega = 2*pi/T;

A = [ones(size(x)) cos(omega*x) sin(omega*x)];
c = A\y;
r = A*c - y;

days = 1 : 1 : 365;
sun_hours = @(day) c(1) + c(2)*cos(omega*day) + c(3)*sin(omega*day);

subplot(1, 2, 1);
plot(x, y, 'o', days, sun_hours(days));
subplot(2, 2, 2);
%plot(x, y, 'o', x, r, '*');
plot(x, r);

sun_hours(157)
felkvsum = r'*r