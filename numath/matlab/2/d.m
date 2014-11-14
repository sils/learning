k = 20;
f = @(x) x.^k .* exp(x-1);

% Recursive solution
I = 1/exp(1);
for i = 2:k
  I = 1 -i*I;
end

I
% I = 1.048607964211406e+02

simpsonregel(0, 1, 20, f)
% ans =  0.0457997290616918

quadl(f, 0, 1)
% ans =  0.0455448840758181
