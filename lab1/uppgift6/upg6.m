% xInit räknades ut med hjälp av ekvationen x = (z^3 - 2^y)/3. Dessa beräkningar togs bort för att öka läsbarheten.
xInit = [0.2767, -1.1379, 0.9608, -0.0610];
yInit = [1.5150, 2.0100, -1.3500, -2.4500];
zInit = [1.5450, 0.8500, 1.4850, 0.0500];

tolerance = 1e-6;
A = [];
for i=1:4
	x = xInit(i);
	y = yInit(i); 
	z = zInit(i);
	t = ones(3);
	while (norm(t) > tolerance)
		J = [cos(x) 2*y 1/z;
		3 2^y*log(2), -(3*z^2);
		2*x 2*y 3*z^2];
		F = [sin(x) + y^2 + log(z) - 3;
		3*x + 2^y - z^3;
		x^2 + y^2 + z^3 - 6];
		t = J\F;
		x = x - t(1);
		y = y - t(2);
		z = z - t(3);
	end
	A = [A; x, y, z];
end
disp(A);
% Plotta bilden som användes för att fixa startvärden tillsammans med de nya rötterna.
yRange = sqrt(6);
zRange = 6^(1/3);
step = 0.01;

[y, z] = meshgrid(-yRange:step:yRange, 0:step:zRange);

fi = ((sin((z.^3 - 2.^y)/3) + y.^2 + log(z) - 3).^2 + (((z.^3 - 2.^y)/3).^2 + y.^2 + z.^3 - 6).^2);
index = (fi>0.1); fi(index) = Inf;

surfc(y, z, fi);
hold on;
% Plottar i ordningen (y, z, x) för att matcha surfc:en ovan.
scatter3(A(:,2), A(:,3), A(:,1));
hold off;

