function evolventa(x = @(t) 2 * sin(t).^2, y = @(t) 4 * (cos(t)), start_t = 0, end_t = 4 * pi, step = 0.01)
    pkg load symbolic;
    x = sym(x);
    y = sym(y);
    syms t;
    dx_dt = diff(x);
    dy_dt = diff(y);
    x = function_handle(x);
    y = function_handle(y);
    tmp = sqrt(dx_dt.^2 + dy_dt.^2);
    dx_dt = function_handle(dx_dt);
    dy_dt = function_handle(dy_dt);
    tmp = function_handle(tmp);
    % X = x - (dx_dt * int(tmp, 0, t)) / (tmp);
    % Y = y - (dy_dt * int(tmp, 0, t)) / (tmp);
    myintegral = @(f) @(t) quad(f, 0, t);
    integ_tmp = myintegral(tmp);

    t = start_t:step:end_t;
    X = zeros(1, length(t));
    Y = zeros(1, length(t));
    for k = 1:length(t)
        X(k) = x(t(k)) - ( dx_dt(t(k)) *  integ_tmp(t(k)) ) / tmp(t(k));
        Y(k) = y(t(k)) - ( dy_dt(t(k)) *  integ_tmp(t(k)) ) / tmp(t(k));
    end;

    ;
    figure;
    h = plot(X(1 : 5), Y(1: 5), 'b');
    grid on;
    xlim([min(X) - 5, max(X) + 5]);
    ylim([min(Y) - 5, max(Y) + 5]);
    hold on;
    axis equal
    z = length(X) / 10;
    for k = 1:length(X) - z
        set(h, 'XData', X(1:k+z), "YData", Y(1:k+z));
        drawnow;

    end
