disp('Uppgift 2 b)');

clf;

T = [1 32 60 91, 121, 152, 182, 213, 244 274 305 335]';
Y = [6.1 8.0 10.4 13.2, 15.8, 18.0, 18.4, 16.6, 14.1 11.4 8.7 6.6]';

t = 365;
omega = 2*pi/t;

A = [ones(size(T)) cos(T*omega) sin(T*omega)];
c = A\Y;

yanp = A*c;
r = Y - yanp;
felkvsum = r'*r;

disp('Felkvadratsumma:');
disp(felkvsum);


subplot(2, 2, 1);
plot(T, r), title('Residualkurva');

subplot(2, 2, 2);
range = 1:365';
fn = c(1)+c(2)*cos(omega*range)+c(3)*sin(omega*range);

plot(range, fn, T, Y, 'o'), title('Dagslängd');

disp('Nationaldagens längd:');
disp(fn(156));

k = 2;
fn = c(1) + c(2)*cos(omega*range) + c(3)*sin(omega*range) + c(4)*cos(k*omega*range) + c(5)*sin(k*omega*range);
plot(range, fn);
