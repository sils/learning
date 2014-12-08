function [ y ] = mul_householder_QT(H, uu, be, x)
    % THIS FILE IS UNCHANGED
    [m, n] = size(H);
    y = x;
    for i = 1:min(m-1, n)
        u = [zeros(i-1, 1); uu(i); H(i + 1:m, i)];
        y = y - be(i) * (u' * y) * u;
    end
end
