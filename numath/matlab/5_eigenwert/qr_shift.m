function [ lambda, i ] = qr_shift(A, m_max)
  if nargin < 2
    m_max = 1000;
  end;

  it = 0;
  n = size(A, 1);
  lambda = zeros(n, 1);
  A = hess(A);
  while(n > 1 && it < m_max)
     while (it < m_max)
        k = deflationCriterion(A);
        if k > 0
            [lambda(1:k), i1] = qr_shift(A(1:k,1:k), m_max - it);
            [lambda(k+1:n), i2] = qr_shift(A(k+1:n,k+1:n), m_max-it);
            it = it + max(i1, i2);
            if it >= m_max
                i = m_max;
                return;
            else
                i = it;
                lambda = sort(lambda);
                return;
            end;
        else
            ki = A(n, n);
            ki_id = ki*eye(n);
            [Qi, Ri] = qr(A - ki_id);
            A = Ri*Qi + ki_id;
            it = it+1;
            if abs(A(n, n-1)) <= (1E-8)
              lambda(n) = A(n, n);
              break;
            end;
        end;
    end;
    n = n-1;
    A = A(1:n, 1:n);
  end;
  if n == 1
      lambda(1) = A(1, 1);
      lambda = sort(lambda);
  end;
  i = it;
end
