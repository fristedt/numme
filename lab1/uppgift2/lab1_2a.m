x = [91 121 152 182 213 244]';
y = [13.2 15.8 18.0 18.4 16.6 14.1]';
A = [ones(size(x)) x x.^2];

c = A\y; 
yanp = A*c; 
r = y - yanp;
felkvsum = r'*r;

days = 80 : 0.01 : 265;
sun_hours = @(day) c(1) + c(2)*day + c(3)*day.^2;

plot(x, y, 'o', days, sun_hours(days));