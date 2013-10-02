disp('Uppgift 2 a)');

clf;

T = [91, 121, 152, 182, 213, 244]';
Y = [13.2, 15.8, 18.0, 18.4, 16.6, 14.1]';

A = [ones(size(T)) T T.^2];
c = A\Y;

range = 80:265';
poly = c(1)+c(2)*range+c(3)*range.^2;

plot(range, poly, T, Y, 'o');

% hold;
% scatter(t, p);
% p = polyfit(x1,solh1,2);
% x2 = 80:0.1:260;
% y = polyval(p,x2);
% plot(x2,y);
% % b)
% x3 = [1, 32, 60, 274, 305, 335];
% solh2 = [6.1, 8.0, 10.4, 11.4, 8.7, 6.6];
% scatter(x3,solh2);
% hold;
