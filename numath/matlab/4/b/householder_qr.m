function [ H, uu, be, P ]=householder_qr(A)
    H = A;
    [m, n] = size(A);
    P = eye(n); % permutation matrix
    for i=1:min(m-1,n)
        % lets permutate!
        
        [m_value, m_index] = max(H(i,i:n));
        % remember: i is index of submatrix -> transform back
        m_index = m_index + i - 1;
        
        % swapping...
        if (m_index ~= i)
            H(:, [i, m_index]) = H(:, [m_index, i]);
            P(:, [i, m_index]) = P(:, [m_index, i]);
        end
        
        [u, beta] = householder_vec(H(i:m, i));
        H(i:m, i + 1:n) = H(i:m, i + 1:n) - beta * u * (u' * H(i:m, i+1:n));
        H(i, i)  = H(i, i) - beta * u(1) * u' * H(i:m, i);
        H(i+1:m, i) = u(2:m - i + 1);
        uu(i) = u(1);
        be(i) = beta;
    end
end