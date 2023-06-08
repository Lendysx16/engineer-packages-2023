function newton_method(f, a, b)
    x = linspace(a, b, 1000);

    plot(x, f(x));
    hold on
    plot(x, 0 * x);
    grid on;
    eps = 1e-10;
    roots_x = [];
    dx = 0.0005;
    for i = a:0.1:b
        dfdx = (f(i + dx) - f(i - dx)) /2 / dx;
        xprev = i;

        xn = i - (f(i) / dfdx);

        while (abs(xn - xprev) > eps)
            xprev = xn;
            dfdx = (f(xn + dx) - f(xn - dx)) / dx / 2;
            xn = xn - (f(xn) / dfdx);
        end

        if (xn <= b) && (xn >= a)
            roots_x = [roots_x, xn];
        end

    end

    res = unique(roots_x);
    disp(res);
    plot(res, f(res), 'rx');
    hold off

end
