function board = checkerboard(n, m = 0)
    if m == 0
        m = n;
    end
    board = false(n, m);
    for i = 1:n
        for j = 1:m
            if mod(i + j, 2) == 0
                board(i, j) = true;
            end
        end
    end
end