function [ x ] = solve_householder_R(H, y)
    [m, n] = size(H);
    x = y;
    for i = n:-1:1
        for j = i+1:n
            x(i) = x(i) - H(i, j) * x(j);
        end
        x(i) = x(i) / H(i, i);
    end
end
