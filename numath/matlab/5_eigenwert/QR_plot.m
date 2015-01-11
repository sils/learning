function [] = QR_plot(A, m_max, min_convergence)
  if nargin < 3
    min_convergence = 10^-8;
    if nargin < 2
      m_max = 50;
    end;
  end;

  Ai = A;
  for m = 0:m_max
    [Qi, Ri] = qr(Ai);
    Aold = Ai;
    Ai = Qi*Ri;

    surf(Ai);
    colorbar;
    pause;

    # Very simple metric to measure convergence: maximal difference between
    # lowest and highest values
    if (max(abs(max(max(Ai)) - min(min(Aold))),
            abs(min(min(Ai)) - max(max(Aold)))) < min_convergence)
      break;
    end if;
  end for;
end