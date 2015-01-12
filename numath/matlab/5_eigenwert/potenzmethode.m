function [eigenvector, eigenvalue] = potenzmethode(A, u, m_max, min_convergence)
  if nargin < 4
    min_convergence = 10^-8;
    if nargin < 3
      m_max = 1000;
    end;
  end;

  m = 0;
  eigenvalue = 0;
  eigenvector = u;
  for m = 0:m_max
    v = A * eigenvector;
    last_ev = eigenvalue;
    eigenvalue = norm(v);
    eigenvector = v/eigenvalue;

    if abs(eigenvalue - last_ev) > min_convergence
      return;
    end if
  end for
end