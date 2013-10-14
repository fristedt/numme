function f = fp(t, y) 
  f = [y(2)
  y(1)/9 - pi*y(1)*exp(t/3)*(2*y(2)*sin(pi*t) + pi*y(1)*cos(pi*t))];

