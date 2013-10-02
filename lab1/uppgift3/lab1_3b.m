% Framåtdifferens
function x = derivate(f)
    for h=1 : -0.01 : 1e-5
        df = (f(x + h) - f(x)) / h;
    end
    disp(df);
end