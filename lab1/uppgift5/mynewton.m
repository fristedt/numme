% Stulen från intrawebben. Cred till Egon på Stackoverflow.
function x = mynewton(f,dfdx,x0,tolerance)
delta = Inf;
r = Inf;
x = x0;
m = [];
while abs(delta) > tolerance
   xPrev = x;
   rPrev = r;
   r = f(xPrev)./dfdx(xPrev);
   x = xPrev - r;
   m = [m; x r r/rPrev^2];
   delta = xPrev - x; 
end
x=m;
