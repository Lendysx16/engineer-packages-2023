function fracto(polynom = [-8 12 5 5 17 14 -25 -1], left_corner = [-5, 10], right_corner = [5 0], num_of_points_x = 100, num_of_points_y = 100)
    pkg load symbolic
    epsilon = 1e-10;

    roots_ = roots(polynom);
    disp(roots_);

    % convert polynom to symbolic and differentiate it
    func_sym = poly2sym(polynom, 'z');
    func_sym_diff = diff(func_sym, 'z');

    % convert symbolic to lambda_func
    func = function_handle(func_sym);
    func_diff = function_handle(func_sym_diff);

    colormap(viridis(length(roots_) + 1));

    x_coords = [left_corner(1), right_corner(1)];
    y_coords = [right_corner(2), left_corner(2)];

    x = linspace(x_coords(1), x_coords(2), num_of_points_x);
    y = linspace(y_coords(1), y_coords(2), num_of_points_y);

    [X, Y] = meshgrid(x, y);

    Z = X + 1i * Y;
    % newton_iter 
    for k = 1:100
        Z = Z - func(Z) ./ func_diff(Z);
    end

    %check if roots are close to roots of polynom
    z_arr = {};

    for k = 1:length(roots_)
        z_arr{k} = Z - roots_(k) < epsilon;
    end


    z_last = meshgrid(x, y);
    z_last = z_last * 0;


    for k = 1:length(roots_)
        z_last = z_last + z_arr{k};
    end

    z_last = ~z_last;
    z_all = meshgrid(x, y);
    z_all = z_all * 0;
    for k = 1:length(roots_)
        z_all = z_all + z_arr{k} .*k;
    end
    z_all = z_all + z_last.*(length(roots_) + 1);
    image(x_coords, y_coords, z_all);
end
