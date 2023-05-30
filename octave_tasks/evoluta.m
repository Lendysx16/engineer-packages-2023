function evoluta(x, y, t)
    x_values = x(t);
    y_values = y(t);

    dx_dt = gradient(x_values, t);
    dy_dt = gradient(y_values, t);
    d2x_dt2 = gradient(dx_dt, t);
    d2y_dt2 = gradient(dy_dt, t);

	K = (dx_dt .^ 2 + dy_dt .^ 2) ./ (dx_dt .* d2y_dt2 - d2x_dt2 .* dy_dt);
    X = x_values - K .* dy_dt;
    Y = y_values + K .* dx_dt;
    figure;
    
    plot(x_values, y_values, 'b', 'LineWidth', 2);
    hold on;
    
    plot(X, Y, 'r--', 'LineWidth', 2);
    xlim([t(1)-100 t(end)+100]);
    ylim([min(y_values)- 50 max(y_values) + 50]);
    hold off;

    xlabel('x');
    ylabel('y');
	axis equal;
end
