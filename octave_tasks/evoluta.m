function evoluta(x = @(t) 4*cos(t), y = @(t) 5*sin(t), start_t = 0, end_t = 20*pi, step = 0.01)
    pkg load symbolic;

    x = sym(x);
    y = sym(y);
    dx_dt = diff(x);
    dy_dt = diff(y);
    d2x_dt2 = diff(dx_dt);
    d2y_dt2 = diff(dy_dt);

	  K = (dx_dt ^ 2 + dy_dt ^ 2) / (dx_dt * d2y_dt2 - d2x_dt2 * dy_dt);
    X = x - K * dy_dt;
    Y = y + K * dx_dt;

    X = function_handle(X);

    Y = function_handle(Y);

    t = start_t:step:end_t;

    X = X(t);
    Y = Y(t);
    h = plot(X(1:10), Y(1:10));
    axis equal;
    xlim([min(X) - 5, max(X) + 5]);
    ylim([min(Y)- 5, max(Y) + 5]);
    for k = 1:1:length(X)
      set(h, 'XData', X(1:k), 'YData', Y(1:k));
      pause(0.01);
      drawnow;
    endfor

    xlabel('x');
    ylabel('y');
	  axis equal;
end
