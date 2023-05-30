function half_division(f, a, b)
    x = linspace(a, b, 100);
    plot(x, f(x));
    hold on
    plot(x, 0 * x);
    grid on;
    root = [];
    eps = 1e-10;
    for i = 1:length(x)-1
        if f(x(i)) * f(x(i+1)) > 0
            continue;
        end
        while abs(x(i+1) - x(i)) > eps
            c = (x(i) + x(i+1)) / 2;
            if f(c) * f(x(i)) > 0
                x(i) = c;
            else
                x(i+1) = c;
            end
        end
        root = [root, x(i)];
    end
    root = unique(root);
    disp(root);
    plot(root, f(root), 'rx');
end
