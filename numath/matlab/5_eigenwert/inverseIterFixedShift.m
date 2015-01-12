function [ lambda, steps ] = inverseIterFixedShift(shift, A, u0, m_max, min_convergence)
% THIS IS WIP
  if nargin < 5
    min_convergence = 10^-8;
    if nargin < 4
      m_max = 1000;
    end;
  end;

  um = u0;
  identity = eye(size(A));
  for m = 0:m_max
    vm = (lambda*identity - A) \ um;
  end;
end