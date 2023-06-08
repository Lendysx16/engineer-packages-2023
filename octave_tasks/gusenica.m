function value = gusenica(f = @(x) cos(x) , n = 15)
  t = -50:0.1:50;
  r = 1;
  x = r*cos(t);
  y = r*sin(t);
  s = 0;
  G = []
  hold on;
  for i = 1:n
    G(i) = plot(x + s*r,y);
    s = s + 2;
  endfor
  axis equal;
  k = 0;
  p = n - 1;
  for i = 1:15
    for j = 1:n
      set(G(j),'XData', x + k*r + i, 'YData', y + f(i + p));
      drawnow;
      pause(0.1);
      p = p - 1;
      if (p == 0)
        p = n - 1;
      endif
      k = k + 2;
    endfor
  endfor
  for i = 15:-1:1
    for j = n:-1:1
      set(G(j),'XData', x + k*r + i, 'YData', y + f(i + p));
      drawnow;
      pause(0.1);
      p = p - 1;
      if (p == 0)
        p = n - 1;
      endif
      k = k + 2;
    endfor
  endfor
end
