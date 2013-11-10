v0 = 2e5;
x0 = 1.2*a; 
y0 = 0; 
z0 = 0.15*a;
dx0 = 0; 
dy0 = v0
dz0 = 0;

s0 = [x0; dx0; y0; dy0; z0; dz0];

[T, S] = ode45(@fp2, [0 10], s0);
