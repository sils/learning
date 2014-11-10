function [ result ] = gaussformel(a, b, n, f)
  part_size = (b-a)/n;
  
  result = 0;
  x1 = part_size * (1-1/sqrt(3))/2;
  x2 = part_size * (1+1/sqrt(3))/2;
  for int_start = a:part_size:b-part_size
    result = result + f(int_start + x1)/2 + f(int_start + x2)/2;
  end
  
  result = result * part_size;

end
