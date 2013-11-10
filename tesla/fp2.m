function f = fp2(t, s)
  global a C
  cp = 2e7;
  br = C * 4 * integral(@(fi) (s(5) .* cos(fi)) ./ sqrt((sqrt(s(1)^2 + s(3)^2) - a.*cos(fi)).^2 + a^2*sin(fi).^2 + s(5)^2).^3, 0, pi/2);
  bx = s(1) / sqrt(s(1)^2 + s(3)^2) * br;
  by = s(3) / sqrt(s(1)^2 + s(3)^2) * br;
  bz = C * 4 * integral(@(fi) (a - sqrt(s(1)^2 + s(3)^2) .* cos(fi)) ./ sqrt((sqrt(s(1)^2 + s(3)^2) - a.*cos(fi)).^2 + a.^2*sin(fi).^2 + s(5)^2).^3, 0, pi/2);
  f = [s(2)
      cp*(s(4)*bz - s(6)*by) 
      s(4)
      cp*(s(6)*bx - s(2)*bz)
      s(6)
      cp*(s(2)*by - s(4)*bx)
  ];
