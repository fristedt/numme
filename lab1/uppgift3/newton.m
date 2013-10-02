% Stulen från intrawebben. Cred till Egon på Stackoverflow.
function x = newton(f,dfdx,x0,tolerance)
err = Inf;
x = x0;
while abs(err) > tolerance
   xPrev = x;
   x = xPrev - f(xPrev)./dfdx(xPrev);
   err = f(x); 
end