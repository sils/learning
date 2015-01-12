function [ lambda ] = qr_shift(A, m_max, min_convergence)
  if nargin < 3
    min_convergence = 10^-8;
    if nargin < 2
      m_max = 50;
    end;
  end;

end
