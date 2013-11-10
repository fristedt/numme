function f = fp(v, rz)
  global C a
  f = [C * integral(@(fi) (rz(2)      .* cos(fi)) ./ sqrt((rz(1) - a.*cos(fi)).^2 + a.^2.*sin(fi).^2 + rz(2).^2).^3, 0, pi/2);
       C * integral(@(fi) (a - rz(1)  .* cos(fi)) ./ sqrt((rz(1) - a.*cos(fi)).^2 + a.^2.*sin(fi).^2 + rz(2).^2).^3, 0, pi/2)];
