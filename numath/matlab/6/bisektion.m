function [zero, res, niter] = bisektion(f, a, b, tol, nmax)
  fa = f(a);
  fb = f(b);
  niter = 0;
  while b - a > tol && niter < nmax
    c = 0.5 * (a + b);
    fc = f(c);
    if fa * fc > 0
      a = c;
      fa = fc;
    else
      b = c;
      fb = fc;
    end
    niter = niter + 1;
  end
  zero = (a + b) / 2;
  res = f(zero);
end
