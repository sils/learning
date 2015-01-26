function [zero, res, niter] = bisektion(f, a, b, tol, nmax)
  if nargin < 5
    if nargin < 4
      tol = eps;
    end
    nmax = 1000;
  end

  fa = f(a);
  fb = f(b);
  for niter = 0:nmax
    zero = 0.5 * (a + b);
    res = f(zero);
    if b - a < tol
      break
    end

    if res * fa <= 0
      fb = res;
      b = zero;
    else
      fa = res;
      a = zero;
    end
  end
end
