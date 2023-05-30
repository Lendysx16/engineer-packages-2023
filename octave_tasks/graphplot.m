function graphplot(func = @(x, y) x.^2 - y.^2, point = [5, 2])
    x = linspace(-10, 10, 100);
    y = linspace(-10, 10, 100);
    [X, Y] = meshgrid(x, y);
    Z = func(X, Y);
    figure("name", func2str(func)(8:end));
    surf(X, Y, Z);

    dx = 0.01;
    dy = 0.01;
    x_coord = point(1);
    y_coord = point(2);
    dz_dx = (func(x_coord + dx, y_coord) - func(x_coord, y_coord)) / dx;
    dz_dy = (func(x_coord, y_coord + dy) - func(x_coord, y_coord)) / dy;
    normal = [dz_dx, dz_dy, -1].*2;

    hold on;
    line_of_vec = quiver3(x_coord, y_coord, func(x_coord, y_coord), normal(1), normal(2), normal(3), 'r', 'linewidth', 2, 'showArrowHead', 'off', 'Marker', 'none', 'color', 'black');
    hold off;

    xlabel('x');
    ylabel('y');
    zlabel('z');
    end
