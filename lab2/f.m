function f = f(u)
  N = length(u);
  x0 = 1;
  xEnd = 3;
  h = (xEnd-x0)/N;
  f = [(u(2) - 2*u(1) + 2)/h^2-(x0+h)^2*u(1)*(u(1)-1)];
  for i=2:N-1
    x = x0 + h*i;
    f = [f; (u(i+1) - 2*u(i) + u(i-1))/h^2 - x^2*u(i)*(u(i)-1)];
  end
  f = [f; (4 - 2*u(N - 1) + u(N - 2))/h^2-(x0+h*(N-1))^2*u(N - 1)*(u(N - 1)-1)];

