function [ u, beta ] = householder_vec(x)
    % THIS FILE IS UNCHANGED
    [n, m] = size(x);
    mu     = x(2:n)' * x(2:n);
    u      = [1; x(2:n)];
    
    if (mu == 0)
        beta = 0;
    else
        u(1) = x(1) + sign(x(1)) * sqrt(x(1) * x(1) + mu);
        beta = 2 / (u(1) * u(1) + mu);
    end;
end

