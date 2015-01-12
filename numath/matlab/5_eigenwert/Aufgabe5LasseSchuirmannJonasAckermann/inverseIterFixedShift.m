function [ lambda, steps ] = inverseIterFixedShift(shift, A, u0, m_max, min_convergence)
  if nargin < 5
    min_convergence = 10^-8;
    if nargin < 4
      m_max = 1000;
    end;
  end;

  um       = u0;
  s        = size(A);
  identity = eye(s);
  l        = [1;zeros(s(1) - 1,1)];
  km       = l'*u0;
  for steps = 0:m_max
    kold = km;
    vm = (shift*identity - A) \ um;
    km = l'*vm;
    um = vm/km;

    if abs(km-kold) < min_convergence
        break;
    end
  end;
  
  lambda=shift-1/km;
end