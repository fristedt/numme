clf;
% Uppgift 3 a)
disp('Uppgift 3 a)');
syms x;
f = 60 * x - (x * x + x + 0.1)^6/(x+1)^6 - 10 * x * exp(-x);
disp('Function f =');
disp(f);
fprim = diff(f);
disp('derivate of function f =');
disp(fprim);
disp('Get derivative of function in point.');
res = int_input('Insert input:');
f_func = @(x)(60 * x - (x * x + x + 0.1)^6/(x+1)^6 - 10 * x * exp(-x));
disp(derivative(f_func,res,1,derivative_flag.Front));
disp('Uppgift 3 b)');
disp('Get front-derivative of function in point.');
res = int_input('Insert input:');
disp(derivative(f_func,res,1,derivative_flag.Front));
disp('Get center-derivative of function in point.');
res = int_input('Insert input:');
disp(derivative(f_func,res,2,derivative_flag.Center));
disp('Derivative in points with step 0.1. Front:');
step = 1e-6;
x = [0.2 1];
for i=1:1:2,
  disp(...
  sprintf('Difference in point %u: %u',...
  x(i),...
  abs(derivative(f_func,x(i),step,derivative_flag.Front) - derivative(f_func,x(i),step,derivative_flag.Center))));
end

disp('Uppgift 3 d');

res = int_input('Insert x:');

disp('Metod      Fel')

t1v = [];
t2v = [];
iv = [];

fprimf = matlabFunction(fprim);

for i = -3:-1:-13,
  h = 10^i;
  t0 = fprimf(res);
  t1 = abs(t0 - derivative(f_func, res, h, derivative_flag.Front));
  t2 = abs(t0 - derivative(f_func, res, h, derivative_flag.Center));

  iv = [iv h];
  t1v = [t1v t1];
  t2v = [t2v t2];

  disp(sprintf('Front   %f', t1))
  disp(sprintf('Center  %f', t2))
end

hold on;
loglog(t1v, '--');
loglog(t2v);
legend('Front', 'Center');
hold off;
