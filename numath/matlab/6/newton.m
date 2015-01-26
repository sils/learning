function [zero, res, niter] = newton(f, df, x0, tol, nmax)
  if nargin < 5
    if nargin < 4
      tol = eps;
    end
    nmax = 1000;
  end

  for niter = 0:nmax
    zero = x_0 - f(x_0) / df(x_0);
    res = f(zero);
    if abs(zero - x_0) < tol
      break;
    end
    x_0 = zero;
  end
end
