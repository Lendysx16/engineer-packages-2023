g = 9.8;
L = 1;
tspan = [0 5];
y0 = [pi / 2, 1];

[T, Y] = ode45(@(t, y) [y(2); -g / L * sin(y(1))], tspan, y0);

x = L * sin(Y(:, 1));
y = -L * cos(Y(:, 1));

figure;
plot(T, x);

figure;

for i = 1:length(T)
    plot([0 x(i)], [0 y(i)], '-o', 'MarkerSize', 10, 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b');
    axis equal;
    axis([-L - 1, L + 1, -L - 1, L + 1]);
    drawnow;
end
