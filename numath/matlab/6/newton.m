function [zero, res, niter] = newton(f, df, x0, tol, nmax)
  if nargin < 5
    if nargin < 4
      tol = eps;
    end
    nmax = 1000;
  end

  for niter = 0:nmax
    zero = x0 - f(x0) / df(x0);
    res = f(zero);
    if abs(zero - x0) < tol
      break;
    end
    x0 = zero;
  end
end
