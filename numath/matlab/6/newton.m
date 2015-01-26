function [zero, res, niter] = newton(f, df, x0, tol, nmax)
  if nargin < 5
    if nargin < 4
      tol = eps;
    end
    nmax = 1000;
  end

  last_x = x0;
  for niter = 0:nmax
    zero = last_x - f(last_x) / df(last_x);
    res = f(zero);
    if abs(zero - last_x) < tol
      break;
    end
    last_x = zero;
  end
end
