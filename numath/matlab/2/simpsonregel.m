function [ result ] = simpsonregel(a, b, n, f)

  part_size = (b-a)/n;
  
  result = f(a)+f(b);
  
  partone = 0;
  for int_start = a+part_size:2*part_size:b-part_size
    partone = partone + f(int_start);
  end
  result = result + 4*partone;
  
  parttwo = 0;
  for int_start = a+2*part_size:2*part_size:b-2*part_size
    parttwo = parttwo + f(int_start);
  end
  result = result + 2*parttwo;
  
  result = result * 2*part_size/6;

end
