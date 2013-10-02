% Framåtdifferens
function df =  myfdiff(f, x, h)
    df = (f(x + h) - f(x)) / h;
end