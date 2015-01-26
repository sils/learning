function [zero, res, niter] = newton(f, df, x0, tol, nmax)
  if nargin < 5
    if nargin < 4
      tol = eps;
    end
    nmax = 1000;
  end

  x_alt = x0;
  niter = 0;
  while 1
    x_neu = x_alt - f(x_alt) / df(x_alt);
    niter = niter + 1;
    if abs(x_neu - x_alt) < tol || niter >= nmax
      break;
    end
    x_alt = x_neu;
  end
  zero = x_neu;
  res = f(zero);
end
