function [x] = backslash(d, n)
    P = generatePoisson(d, n);
    b = P * ones(n^d, 1);
    x = P \ b;
end
