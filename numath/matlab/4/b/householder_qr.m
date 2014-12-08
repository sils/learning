function [H, uu, be]=householder_qr(A)
    H = A;
    [m, n] = size(A);
    for i = 1:min(m-1, n)
        [u, beta] = householder_vec(H(i:m, i));
        H(i:m ,i+1:n) = H(i:m, i+1:n) - beta * u *(u' * H(i:m, i+1:n));
        H(i, i) = H(i, i) - beta * u(1) * u' * H(i:m, i);
        H(i+1:m, i) = u(2:m - i + 1);
        uu(i) = u(1);
        be(i) = beta;
    end
end