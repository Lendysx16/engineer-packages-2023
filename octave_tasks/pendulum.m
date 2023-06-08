function pendulum(length_pen = 1, start_angle = pi / 4, amplitude = 0.8)
  g = 9.8;
  L = length_pen;
  tspan = [0 5];
  y0 = [start_angle, amplitude];

  [T, Y] = ode45(@(t, y) [y(2); -g / L * sin(y(1))], tspan, y0);

  x = L * sin(Y(:, 1));
  y = -L * cos(Y(:, 1));

  figure;

  for i = 1:length(T)
      plot([0 x(i)], [0 y(i)], '-o', 'MarkerSize', 10, 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');
      axis equal;
      axis([-L - 1, L + 1, -L - 1, L + 1]);
      drawnow;
  end

end
