function [P] = generatePoisson(d, n)
  if !ismember(d, [1,2,3]) || n < 2
    error('Input values are invalid.');
  end
end
