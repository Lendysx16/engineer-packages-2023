function fzero_func(f, a, b)
    x = linspace(a, b, 1000);
    plot(x, f(x));
    hold on
    plot(x, 0 * x);
    grid on;
    root = [];
    for i = 1:length(x) - 1
        x_1 = x(i);
        x_2 = x(i + 1);

        if f(x_1) * f(x_2) > 0
            continue
        end
        res = fzero(f, [x_1, x_2]);
        root = [root, res];
    end
    root = unique(root);
    disp(root);
    plot(root, f(root), 'rx');
end