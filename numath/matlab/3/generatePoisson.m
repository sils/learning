function [P] = generatePoisson(d, n)
  if ~ismember(d, [1,2,3]) || n < 2
    error('Input values are invalid.');
  end
  P = full(gallery('tridiag', n, -1, 2, -1));
  
  % kron is associative and distributive
  if d > 1
      I = eye(n);
      IP = kron(I, P);
      PI = kron(P, I);

      P = IP + PI;

      if d>2
        P = kron(I, P) + kron(PI, I);
      end
  end
end
