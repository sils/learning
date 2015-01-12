function [ lambda, i ] = qr_shift(A, m_max)
  if nargin < 3
    m_max = 1000;
  end;

  i = 0;
  n = size(A, 1);
  identity = eye(n);
  lambda = zeros(n, 1);
  Ai = hess(A);
  while(n > 1 && i < m_max)
    %ab hier neu
    k = deflationCriterion(A);
    if k > 0
        [lambda(1:k), i1] = qr_shift(A(1:k,1:k));
        [lambda(k+1:n), i2] = qr_shift(A(k+1:n,k+1:n));
        i = i + max(i1, i2);
        if i >= m_max
            i = m_max;
            return;
        else
            lambda = sort(lambda);
            return;
        end;
    else
        %bis hier neu
        ki = Ai(n, n)^i;
        if abs(Ai(n, n-1)) <= 10^-8
          lambda(n) = Ai(n, n);
          n = n-1;
          Ai = Ai(1:n, 1:n);
          identity = eye(n);
          if n == 1
            lambda(1) = A(1, 1);
            break;
          end;
        end;
    end;

    ki_id = ki*identity;
    [Qi, Ri] = qr(Ai - ki_id);
    Ai = Ri*Qi + ki_id;
  end;

  lambda = sort(lambda);
end
