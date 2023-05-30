function res = fence(r,c = 0)
    if c == 0
        c = r;
        end

    res = false(r,c);
    res(1:end, 1:2:end) = true;
end