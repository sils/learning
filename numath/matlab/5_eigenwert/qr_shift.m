function [ lambda ] = qr_shift(A, m_max, min_convergence)
  if nargin < 3
    min_convergence = 10^-8;
    if nargin < 2
      m_max = 1000;
    end;
  end;

  identity = eye(size(A));
  for i = 0:m_max
    % TODO: get ki

    ki_id = ki*identity;
    [Qi, Ri] = qr(Ai - ki_id);
    Aold = Ai;
    Ai = Ri*Qi + ki_id;
    
    if (max(abs(max(max(Ai)) - min(min(Aold))), ...
            abs(min(min(Ai)) - max(max(Aold)))) < min_convergence)
      return;
    end
  end;
end
