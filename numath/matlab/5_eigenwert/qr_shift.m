function [ lambda, i ] = qr_shift(A, m_max)
  if nargin < 3
    m_max = 1000;
  end;

  A = hess(A);
  n = size(A, 1);
  identity = eye(n);
  lambda = zeros(n, 1);
  Ai = A;
  for i = 0:m_max
    ki = Ai(n, n)^i;
    if Ai(n, n-1) <= 10^-8
      lambda(n) = Ai(n, n);
      n = n-1;
      Ai = Ai(1:n, 1:n);
      identity = eye(n);
      if n == 1
        lambda(1) = A(1, 1);
        break;
      end;
    end;

    ki_id = ki*identity;
    [Qi, Ri] = qr(Ai - ki_id);
    Ai = Ri*Qi + ki_id;
  end;

  lambda = sort(lambda);
end
