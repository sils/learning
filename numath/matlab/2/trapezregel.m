function [ result ] = trapezregel(a, b, n, f)

  part_size = (b - a)/n;
  half_part_size = part_size/2;

  
  result = (f(a)+f(b))/2;
  for int_start = a+part_size:part_size:b-part_size
    result = result + f(int_start);
  end

  result = result * part_size;
end
