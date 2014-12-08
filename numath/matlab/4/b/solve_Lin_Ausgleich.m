function [ x ] = solve_Lin_Ausgleich(A, b)
    [m, n] = size(A);
    [H, uu, be, P] = householder_qr(A);
    y = mul_householder_QT(H, uu, be, b);
    x = P * solve_householder_R(H, y(1:n));
end
