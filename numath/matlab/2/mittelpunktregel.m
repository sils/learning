function [ result ] = mittelpunktregel(a, b, n, f)

  part_size = (b - a)/n;
  half_part_size = part_size/2;

  
  result = 0;
  for int_start = a:part_size:b
    result = result + f(int_start+half_part_size);
  end

  result = result * part_size;
end
