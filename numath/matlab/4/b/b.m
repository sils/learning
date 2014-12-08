function [ ] = b()
    A = [1, 1,  2;
         0, 0,  2;
         1, 1,  1;
         2, 2, -1];
    b1 = [2; 1; 2; 1];
    b2 = [3; 1; 2; 1];
    
    % This somehow works
    solve_Lin_Ausgleich(A, b1)
end
