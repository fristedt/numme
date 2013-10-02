clf;
hold on;
syms x
format long;

fn = @(x)(60*x - 10*x*exp(-x) - (x^2 + x + 1/10)^6/(x + 1)^6);

disp(diff(fn(x)));

fp = @(x)(10*x*exp(-x) - 10*exp(-x) + (6*(x^2 + x + 1/10)^6)/(x + 1)^7 - (6*(2*x + 1)*(x^2 + x + 1/10)^5)/(x + 1)^6 + 60);

tolerance = 1e-6;

disp('               X                      Fel        Asymptotiska Felkonstanten');

newton(fn, fp, 1, tolerance, 1);
disp(' ');
newton(fn, fp, 3, tolerance, 1);

% Felkonstanten uppskattas med formeln h(n)/h(n-1)^P där h är felet från Newton-
% Raphsons formel (f(x)/f'(x)) samt P = 2 (noggranhetsordningen) ty iterationerna
% uppvisar kvadratisk konvergens.
% 
% Gränsen bestäms av +- tolerance (10^-6).

hold off;
