function [x] = solve_inverse(d, n)
    P = generatePoisson(d, n);
    b = P * ones(n^d, 1);
    x = inv(P) * b;
end
