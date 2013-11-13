function f = fp2(t, s)
  a  = 0.1;
  I0 = 2.0;
  ur = 40000;
  C  = ur * I0 * a * 1e-7;
  cp = 2e7;
  r = sqrt(s(1)^2 + s(3)^2);
  % fispan = [0: 0.1: pi/2];
  % br = (s(5) .* cos(fispan)) ./ sqrt((r - a.*cos(fispan)).^2 + a^2*sin(fispan).^2 + s(5)^2).^3
  br = C * 4 * integral(@(fi) (s(5) .* cos(fi)) ./ sqrt((r - a.*cos(fi)).^2 + a^2*sin(fi).^2 + s(5)^2).^3, 0, pi/2);
  bx = s(1) / r * br;
  by = s(3) / r * br;
  bz = C * 4 * integral(@(fi) (a - r .* cos(fi)) ./ sqrt((r - a.*cos(fi)).^2 + a.^2*sin(fi).^2 + s(5)^2).^3, 0, pi/2);

  f = [s(2)
      cp*(s(4)*bz - s(6)*by) 
      s(4)
      cp*(s(6)*bx - s(2)*bz)
      s(6)
      cp*(s(2)*by - s(4)*bx)];
